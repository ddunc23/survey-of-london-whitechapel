from django.db import models
from django.db.models import F, Q
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
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


def update_feature_count(feature):
	"""Tallies the 'count' variable for features. Run when features, documents, images, or media are saved"""
	if feature.site != None:
		# Only update all features in a site if the feature being saved is on a site!
		site = feature.site
		site_features = Feature.objects.filter(site=site)
		aggregated_items = []
		for s_feature in site_features: 
			all_docs = Document.objects.filter(published=True, feature=s_feature)
			all_images = Image.objects.filter(published=True, feature=s_feature)
			all_media = Media.objects.filter(published=True, feature=s_feature)
			agg_docs = all_docs.filter(aggregate=True)
			agg_images = all_images.filter(aggregate=True)
			agg_media = all_media.filter(aggregate=True)

			if len(agg_docs) > 0:
				for doc in agg_docs:
					aggregated_items.append(doc)
			if len(agg_images) > 0:
				for image in agg_images:
					aggregated_items.append(image)
			if len(agg_media) > 0:
				for item in agg_media:
					aggregated_items.append(item)

			# Tally up all the un-aggregated UGC attached to s_feature
			count = all_docs.filter(aggregate=False).count() + all_images.filter(aggregate=False).count() + all_media.filter(aggregate=False).count()
			# Update s_feature.count using .update() so as not get stuck in a .save() loop
			Feature.objects.filter(id=s_feature.id).update(count=count)

		# Now add the total number of aggregated items to each feature on the site, again using .update() rather than .save()
		site_features.update(count=F('count') + len(aggregated_items))

	else:
		# If feature.site is None, just tally the 'count' as normal
		all_docs = feature.documents.filter(published=True).count()
		all_images = feature.images.filter(published=True).count()
		all_media = feature.media.filter(published=True).count()
		count = all_docs + all_images + all_media
		# Turn single Feature object into a queryset so you can run update on it. We'e using .update() rather than .save() so we don't get stuck in a loop
		feature_set = Feature.objects.filter(id=feature.id)
		feature_set.update(count=count)


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
	b_number = models.CharField(max_length=16, null=True, blank=True, verbose_name='Building Number')
	b_name = models.CharField(max_length=100, null=True, blank=True, verbose_name='Building Name')
	street = models.CharField(max_length=100, null=True, blank=True)
	postcode = models.CharField(max_length=8)
	address = models.CharField(max_length=100, verbose_name='Formatted Address')
	b_type = models.CharField(max_length=100, null=True, blank=True, verbose_name='Building Type')
	FEATURE_CHOICES = (
		('WHITECHAPEL_BUILDING', 'Building in Whitechapel'),
		('GREATER_WHITECHAPEL', 'Building in Greater Whitechapel'),
		('OPEN_SPACE', 'Open Space'),
		('PLACE', 'Area or Market'),
	)
	feature_type = models.CharField(max_length=100, verbose_name='Feature Type', choices=FEATURE_CHOICES, default='WHITECHAPEL_BUILDING')
	current = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_1 = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_2 = models.PositiveSmallIntegerField(null=True, blank=True)
	previous_3 = models.PositiveSmallIntegerField(null=True, blank=True)
	extension_1 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 1')
	extension_2 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 2')
	extension_3 = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Extension/Alteration 3')
	f_date = models.PositiveSmallIntegerField(null=True, blank=True, verbose_name='Facade Date')
	storeys = models.PositiveSmallIntegerField(null=True, blank=True)
	demolished = models.BooleanField(default=False)
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
	THUMBNAIL_POSITION_CHOICES = (
		('TOP', 'Top'),
		('CENTRE', 'Centre'),
		('BOTTOM', 'Bottom'),
	)
	thumbnail_position = models.CharField(max_length=6, choices=THUMBNAIL_POSITION_CHOICES, default='CENTRE', verbose_name='Header Image Alignment')
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		if (self.b_name == None) or (self.b_name == ''):
			return self.address
		else:
			return self.b_name

	def save(self, *args, **kwargs):
		super(Feature, self).save(*args, **kwargs)
		update_feature_count(self)
		

	def get_absolute_url(self):
		return reverse('map.views.detail', args=[str(self.id)])

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


class Document(models.Model):
	"""A user-submitted or Survey of London text document attached to a feature."""
	feature = models.ForeignKey(Feature, related_name='documents')
	author = models.ForeignKey(User, related_name='documents')
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
		('NOTE', 'Note'),
	)
	document_type = models.CharField(max_length=16, choices=DOCUMENT_TYPE_CHOICES, default='HISTORY')
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	aggregate = models.BooleanField(default=False, verbose_name="Aggregate to Site")
	created = models.DateField(auto_now_add=True, null=True, blank=True)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)
	tags = TaggableManager(blank=True)

	def __unicode__(self):
		#try: 
		#	author_name = self.author.userprofile.display_name
		#except:
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
		update_feature_count(self.feature)

	def delete(self, *args, **kwargs):
		"""If a document is deleted, update the feature count to reflect this"""
		super(Document, self).delete(*args, **kwargs)
		update_feature_count(self.feature)


class Image(models.Model):
	"""A user-submitted image"""
	feature = models.ForeignKey(Feature, related_name='images')
	author = models.ForeignKey(User, related_name='images')
	title = models.CharField(max_length=128)
	description = models.TextField(null=True, blank=True)
	file = models.ImageField(upload_to=feature_directory_path, null=True, blank=False, verbose_name='Image')
	published = models.BooleanField(default=False)
	pending = models.BooleanField(default=False)
	aggregate = models.BooleanField(default=False, verbose_name="Aggregate to Site")
	created = models.DateField(auto_now_add=True, null=True, blank=True)
	last_edited = models.DateField(auto_now=True, null=True, blank=True)
	tags = TaggableManager(blank=True)
	copyright = models.BooleanField(default=False)
	order = models.PositiveSmallIntegerField(default=0)

	def __unicode__(self):
		#try: 
		#	author_name = self.author.userprofile.display_name
		#except:
		author_name = self.author.username

		return self.title + ' | ' + author_name

	def save(self, *args, **kwargs):
		"""Bleach the description, Update the 'count' attribute of the feature"""
		self.description = bleach.clean(self.description, tags=['strong', 'em', 'a'], attributes={'a': ['href']})
		super(Image, self).save(*args, **kwargs)
		update_feature_count(self.feature)

	def delete(self, *args, **kwargs):
		"""If an image is deleted, update the feature count to reflect this"""
		super(Image, self).delete(*args, **kwargs)
		update_feature_count(self.feature)


class Media(models.Model):
	"""A user-submitted video or audio"""
	feature = models.ForeignKey(Feature, related_name='media')
	author = models.ForeignKey(User, related_name='media')
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
		#try:
		#	author_name = self.author.userprofile.display_name
		#except:
		author_name = self.author.username

		return self.title + ' | ' + author_name

	class Meta:
		verbose_name_plural = 'Media'

	def save(self, *args, **kwargs):
		"""Update the 'count' attribute of the feature"""
		self.description = bleach.clean(self.description, tags=['strong', 'em', 'a'], attributes={'a': ['href']})
		super(Media, self).save(*args, **kwargs)
		update_feature_count(self.feature)

	def delete(self, *args, **kwargs):
		"""If an image is deleted, update the feature count to reflect this"""
		super(Media, self).delete(*args, **kwargs)
		update_feature_count(self.feature)