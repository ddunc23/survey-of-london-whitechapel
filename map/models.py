from django.db import models
from django.contrib.auth.models import User
from djgeojson.fields import PolygonField
from django.contrib.gis.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
import bleach
import markdown
import html2text
import re

def feature_directory_path(instance, filename):
	"""Function to ensure image files will be uploaded to /uploads/features/<feature.id>/filename"""
	return 'uploads/features/{0}/{1}'.format(instance.id, filename)

class UserProfile(models.Model):
	"""Additional Attributes for the User model"""
	user = models.OneToOneField(User)
	display_name = models.CharField(max_length=100, blank=True, null=True)

	def __unicode__(self):
		return self.user.username

class Category(models.Model):
	name = models.CharField(max_length=128)
	description = models.CharField(max_length=140, blank=True, null=True)
	thumbnail = models.ImageField(null=True, blank=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.name


class Feature(models.Model):	
	id = models.PositiveSmallIntegerField(primary_key=True)
	geom = models.MultiPolygonField(verbose_name='Footprint Geometry')
	b_number = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Building Number')
	b_name = models.CharField(max_length=100, null=True, blank=True, verbose_name='Building Name')
	street = models.CharField(max_length=100, null=True, blank=True)
	postcode = models.CharField(max_length=8)
	address = models.CharField(max_length=100, verbose_name='Formatted Address')
	b_type = models.CharField(max_length=100, null=True, blank=True)
	original = models.PositiveSmallIntegerField(null=True, blank=True)
	rebuild_1 = models.PositiveSmallIntegerField(null=True, blank=True)
	rebuild_2 = models.PositiveSmallIntegerField(null=True, blank=True)
	f_date = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Facade Data')
	storeys = models.PositiveSmallIntegerField(null=True, blank=True)
	basement = models.CharField(max_length=8,null=True, blank=True)
	architect = models.CharField(max_length=100, null=True, blank=True)
	builders = models.CharField(max_length=100, null=True, blank=True)
	materials = models.CharField(max_length=100, null=True, blank=True)
	type = models.CharField(max_length=100, null=True, blank=True)
	c_area = models.CharField(max_length=8,null=True, blank=True, verbose_name='Conservation Area')
	listed = models.CharField(max_length=8,null=True, blank=True, verbose_name='Listed')
	count = models.PositiveSmallIntegerField(default=0)
	categories = models.ManyToManyField(Category, blank=True)
	thumbnail = models.ImageField(upload_to=feature_directory_path, null=True, blank=True, verbose_name='Thumbnail Image')
	tags = TaggableManager(blank=True)
	banner = models.ImageField(upload_to=feature_directory_path, null=True, blank=True, verbose_name='Banner Image')

	def __unicode__(self):
		if self.b_name != None:
			return self.b_name
		else:
			return self.address

	class Meta:
		verbose_name = 'Building'

# Auto-generated `LayerMapping` dictionary for Feature model
feature_mapping = {
    'id' : 'id',
    'b_number' : 'B_Number',
    'b_name' : 'B_Name',
    'street' : 'Street',
    'postcode' : 'Postcode',
    'type' : 'Type',
    'original' : 'Original',
    'rebuild_1' : 'Rebuild_1',
    'rebuild_2' : 'Rebuild_2',
    'f_date' : 'F_Date',
    'storeys' : 'Storeys',
    'basement' : 'Basement',
    'architect' : 'Architect',
    'builders' : 'Builders',
    'materials' : 'Materials',
    'c_area' : 'C_Area',
    'listed' : 'Listed',
    'address' : 'Address',
    'geom' : 'MULTIPOLYGON',
}


class DocumentType(models.Model):
	name = models.CharField(max_length=64)

	def __unicode__(self):
		return self.name


class Document(models.Model):
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=True)
	start_year = models.PositiveSmallIntegerField(null=True, blank=True)
	end_year = models.PositiveSmallIntegerField(null=True, blank=True)
	order = models.PositiveSmallIntegerField(default=0)
	document_type = models.ForeignKey(DocumentType, blank=True, null=True)
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)

	def __unicode__(self):
		return self.feature.b_name + ' | ' + self.title

	def save(self, *args, **kwargs):
		"""Sanitize html input from users, add footnotes and calculate the number of documents attached to a feature."""
		
		# Take self.body, and, if there are footnotes that have already been turned into HTML, turn them back into Markdown
		fnref_regex = re.compile(r'<sup id="fnref:\d+"><a class="footnote-ref" href="#fn:\d+" rel="footnote">\d+</a></sup>')
		fnanchor_regex = re.compile(r':\d+')
		fnbody_regex = re.compile(r'<li id="fn:\d+">\r\n<p>.+\r\n</li>')
		fncontent_regex = re.compile(r'<li id="fn:\d+">\r\n<p>.+&#160;')
		# print self.body
		# print fnbody_regex.findall(self.body)
		
		footnote_ref_replacements = []
		for ref in fnref_regex.findall(self.body):
			replacement = fnanchor_regex.search(ref)
			replacement = replacement.group(0)
			footnote_ref_replacements.append('[^' + replacement.strip(':')  + ']')

		footnote_body_replacements = []
		for i, footnote in enumerate(fnbody_regex.findall(self.body)):
			replacement = fncontent_regex.search(footnote)
			if replacement.group(0):
				replacement = replacement.group(0)
				footnote_body_replacements.append('[^' + str(i+1) +']: ' + replacement.strip('<li id="fn:1234567890>\n\r<p>&#160;') + r'\r\n')
			else: 
				pass

		print footnote_body_replacements

		processed_html = self.body
		for rep in footnote_ref_replacements:
			processed_html = fnref_regex.sub(rep, processed_html, 1)

		for rep in footnote_body_replacements:
			processed_html = fnbody_regex.sub(rep, processed_html, 1)

		self.body = processed_html

		# Convert HTML to Markdown so you can run the footnote filter on it
		self.body = html2text.html2text(self.body)
		# Convert the Markdown back into HTML. Surely there's a better way than this!
		self.body = markdown.markdown(self.body, extensions=['markdown.extensions.footnotes'])
		# self.body = bleach.clean(self.body, tags=['p', 'b', 'strong', 'em', 'img', 'a', 'blockquote', 'i', 'li', 'ul', 'ol', 'h2', 'h3', 'sup', 'div', 'hr',])
		# print self.body
		super(Document, self).save(*args, **kwargs)
		documents = Document.objects.filter(feature=self.feature)
		feature = Feature.objects.get(id=self.feature.id)
		feature.count = len(documents)
		feature.save()


class Story(models.Model):
	feature = models.ForeignKey(Feature, null=True, blank=True)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=True)
	author = models.CharField(max_length=128)

	def __unicode__(self):
		return self.title

	class Meta:
		verbose_name_plural = "Stories"