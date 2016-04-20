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
	"""Feature categories"""
	name = models.CharField(max_length=128)
	description = models.CharField(max_length=140, blank=True, null=True)
	thumbnail = models.ImageField(null=True, blank=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.name


class Feature(models.Model):
	"""A building footprint, open space, or other interactable vector object"""
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
	"""Document subcategories"""
	name = models.CharField(max_length=64)

	def __unicode__(self):
		return self.name


class Document(models.Model):
	"""A user-generated or Survey of London text document attached to a feature."""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=True)
	body_processed = models.TextField(null=True, blank=True)
	start_year = models.PositiveSmallIntegerField(null=True, blank=True)
	end_year = models.PositiveSmallIntegerField(null=True, blank=True)
	order = models.PositiveSmallIntegerField(default=0)
	document_type = models.ForeignKey(DocumentType, blank=True, null=True)
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	anonymise = models.BooleanField(default=False)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)

	def __unicode__(self):
		if self.feature.b_name:
			return self.author.userprofile.display_name + ' | ' + self.feature.b_name + ' | ' + self.title
		else:
			return self.feature.address + ' | ' + self.title

	def save(self, *args, **kwargs):
		"""Sanitize html input from users, add footnotes and calculate the number of documents attached to a feature."""
		# Clean the html
		self.body = self.body = bleach.clean(self.body, tags=['p', 'b', 'strong', 'em', 'img', 'a', 'blockquote', 'i', 'li', 'ul', 'ol', 'h2', 'h3', 'br'])
		# Convert HTML to Markdown so you can run the footnote filter on it, then save as self.body_processed, which is what gets displayed on the site
		body_markdown = html2text.html2text(self.body)
		self.body_processed = markdown.markdown(body_markdown, extensions=['markdown.extensions.footnotes'])
		super(Document, self).save(*args, **kwargs)
		documents = Document.objects.filter(feature=self.feature)
		feature = Feature.objects.get(id=self.feature.id)
		feature.count = len(documents)
		feature.save()


class Image(models.Model):
	"""A user-generated image"""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	description = models.TextField(null=True, blank=True)
	file = models.ImageField(upload_to=feature_directory_path, null=True, blank=True, verbose_name='Image')
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)

	def __unicode__(self):
		return self.title

class Media(models.Model):
	"""A user-generated video or audio"""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	description = models.TextField(null=True, blank=True)
	url = models.URLField()
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)

	def __unicode__(self):
		return self.title