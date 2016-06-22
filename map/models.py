from django.db import models
from django.db.models import Q
from django.contrib.auth.models import User
from djgeojson.fields import PolygonField
from django.contrib.gis.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
from embed_video.fields import EmbedVideoField
import bleach
import markdown
import html2text
import re

def feature_directory_path(instance, filename):
	"""Function to ensure image files will be uploaded to /uploads/features/<feature.id>/filename"""
	try:
		feature = instance.feature
		return 'uploads/features/{0}/{1}'.format(feature.id, filename)
	except:
		return 'uploads/features/{0}/{1}'.format(instance.id, filename)


class Category(models.Model):
	"""Feature categories"""
	name = models.CharField(max_length=128)
	description = models.CharField(max_length=140, blank=True, null=True)
	thumbnail = models.ImageField(null=True, blank=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.name


class Site(models.Model):
	"""A Site to which many features can belong"""
	name = models.CharField(max_length=140)

	def __unicode__(self):
		return self.name


class Feature(models.Model):
	"""A building footprint, open space, or other interactable vector object"""
	id = models.PositiveSmallIntegerField(primary_key=True)
	geom = models.MultiPolygonField(verbose_name='Footprint Geometry')
	b_number = models.CharField(max_length=16,null=True, blank=True, verbose_name='Building Number')
	b_name = models.CharField(max_length=100, null=True, blank=True, verbose_name='Building Name')
	street = models.CharField(max_length=100, null=True, blank=True)
	postcode = models.CharField(max_length=8)
	address = models.CharField(max_length=100, verbose_name='Formatted Address')
	b_type = models.CharField(max_length=100, null=True, blank=True, verbose_name='Building Type')
	current = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_1 = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_2 = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_3 = models.PositiveSmallIntegerField(null=True, blank=True)
	extension_1 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 1')
	extension_2 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 2')
	extension_3 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 3')
	f_date = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Facade Date')
	storeys = models.PositiveSmallIntegerField(null=True, blank=True)
	BASEMENT_CHOICES = (
		('YES', 'Yes'),
		('NO', 'No'),
	)
	basement = models.CharField(max_length=8,null=True, blank=True, choices=BASEMENT_CHOICES, default='NO')
	architect = models.CharField(max_length=100, null=True, blank=True)
	builders = models.CharField(max_length=100, null=True, blank=True)
	materials = models.CharField(max_length=100, null=True, blank=True)
	short_description = models.CharField(max_length=140, null=True, blank=True, verbose_name='Short Description')
	C_AREA_CHOICES = (
		('YES', 'Yes'),
		('NO', 'No'),
	)
	c_area = models.CharField(max_length=8, null=True, blank=True, verbose_name='Conservation Area', choices=C_AREA_CHOICES, default='NO')
	LISTED_CHOICES = (
		('NO', 'Not Listed'),
		('GRADE_1', 'Grade I'),
		('GRADE_2', 'Grade II'),
		('GRADE_2*', 'Grade II*'),
	)
	listed = models.CharField(max_length=8, null=True, blank=True, verbose_name='Listed', choices=LISTED_CHOICES, default='NO')
	count = models.PositiveSmallIntegerField(default=0)
	categories = models.ManyToManyField(Category, blank=True)
	site = models.ForeignKey(Site, blank=True, null=True)
	thumbnail = models.ImageField(upload_to=feature_directory_path, null=True, blank=True, verbose_name='Thumbnail Image')
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		if (self.b_name == None) or (self.b_name == ''):
			return self.address
		else:
			return self.b_name

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


def update_feature_count(ugc_item):
	"""Update feature.count whenever a new document, image, or media item is added"""
	if ugc_item.feature.site != None:
		on_this_site = Feature.objects.filter(site=ugc_item.feature.site)
		for feature in on_this_site:
			documents = Document.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True).count()
			images = Image.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True).count()
			media = Media.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True).count()
			count = documents + images + media
			feature.count = count
			feature.save()

	else:
		documents = Document.objects.filter(feature=ugc_item.feature).filter(published=True).count()
		images = Image.objects.filter(feature=ugc_item.feature).filter(published=True).count()
		media = Media.objects.filter(feature=ugc_item.feature).filter(published=True).count()
		ugc_item.feature.count = documents + images + media
		ugc_item.feature.save()


class Document(models.Model):
	"""A user-submitted or Survey of London text document attached to a feature."""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=False)
	body_processed = models.TextField(null=True, blank=True)
	start_year = models.PositiveSmallIntegerField(null=True, blank=True)
	end_year = models.PositiveSmallIntegerField(null=True, blank=True)
	order = models.PositiveSmallIntegerField(default=0)
	DOCUMENT_TYPE_CHOICES = (
		('HISTORY', 'Research'),
		('DESCRIPTION', 'Description'),
		('STORY', 'Memory'),
	)
	document_type = models.CharField(max_length=16, choices=DOCUMENT_TYPE_CHOICES, default='HISTORY')
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	aggregate = models.BooleanField(default=False, verbose_name="Aggregate to Site")
	created = models.DateField(auto_now_add=True, null=True, blank=True)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		try:
			author_name = self.author.userprofile.display_name
		except:
			author_name = self.author.username
		if self.feature.b_name:
			return author_name + ' | ' + self.feature.b_name + ' | ' + self.title
		else:
			return author_name + ' | ' + self.feature.address + ' | ' + self.title

	def save(self, *args, **kwargs):
		"""Sanitize html input from users, add footnotes and update the 'count' attribute of the feature"""
		# Clean the html
		self.body = bleach.clean(self.body, tags=['p', 'b', 'strong', 'em', 'img', 'a', 'blockquote', 'i', 'li', 'ul', 'ol', 'h2', 'h3', 'br'], attributes={'img': ['alt', 'src', 'style'], 'a': ['href'],})
		# Convert HTML to Markdown so you can run the footnote filter on it, then save as self.body_processed, which is what gets displayed on the site
		h = html2text.HTML2Text()
		h.ignore_images = False
		body_markdown = h.handle(self.body)
		self.body_processed = markdown.markdown(body_markdown, extensions=['markdown.extensions.footnotes'])
		super(Document, self).save(*args, **kwargs)
		update_feature_count(self)

	def delete(self, *args, **kwargs):
		"""If a document is deleted, update the feature count to reflect this"""
		super(Document, self).delete(*args, **kwargs)
		update_feature_count(self)


class Image(models.Model):
	"""A user-submitted image"""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	description = models.TextField(null=True, blank=True)
	file = models.ImageField(upload_to=feature_directory_path, null=True, blank=False, verbose_name='Image')
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	aggregate = models.BooleanField(default=False, verbose_name="Aggregate to Site")
	created = models.DateField(auto_now_add=True, null=True, blank=True)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		return self.title

	def save(self, *args, **kwargs):
		"""Update the 'count' attribute of the feature"""
		super(Image, self).save(*args, **kwargs)
		update_feature_count(self)

	def delete(self, *args, **kwargs):
		"""If an image is deleted, update the feature count to reflect this"""
		super(Image, self).delete(*args, **kwargs)
		update_feature_count(self)


class Media(models.Model):
	"""A user-submitted video or audio"""
	feature = models.ForeignKey(Feature)
	author = models.ForeignKey(User)
	title = models.CharField(max_length=128)
	description = models.TextField(null=True, blank=True)
	url = EmbedVideoField()
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	aggregate = models.BooleanField(default=False, verbose_name="Aggregate to Site")
	created = models.DateField(auto_now_add=True, null=True, blank=True)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		return self.title

	class Meta:
		verbose_name_plural = 'Media'

	def save(self, *args, **kwargs):
		"""Update the 'count' attribute of the feature"""
		super(Media, self).save(*args, **kwargs)
		update_feature_count(self)

	def delete(self, *args, **kwargs):
		"""If an image is deleted, update the feature count to reflect this"""
		super(Media, self).delete(*args, **kwargs)
		update_feature_count(self)