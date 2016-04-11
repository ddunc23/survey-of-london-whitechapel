from django.db import models
from django.contrib.auth.models import User
from djgeojson.fields import PolygonField
from django.contrib.gis.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager
import bleach


def feature_directory_path(instance, filename):
	"""File will be uploaded to /uploads/features/<feature.id>/filename"""
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
		super(Document, self).save(*args, **kwargs)
		self.body = bleach.clean(self.body, tags=['p', 'b', 'strong', 'em', 'img', 'a', 'blockquote', 'i', 'li', 'ul', 'ol',])
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