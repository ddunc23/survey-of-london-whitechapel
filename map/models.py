from django.db import models
from django.contrib.auth.models import User
from djgeojson.fields import PolygonField
from django.contrib.gis.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from taggit.managers import TaggableManager


def feature_directory_path(instance, filename):
	"""File will be uploaded to /uploads/features/<feature.id>/filename"""
	return 'uploads/features/{0}/{1}'.format(instance.id, filename)

class Category(models.Model):
	name = models.CharField(max_length=128)
	description = models.CharField(max_length=140, blank=True, null=True)
	thumbnail = models.ImageField(null=True, blank=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.name


class Feature(models.Model):
	os_id = models.CharField(max_length=128)
	# geom = PolygonField()
	geom = models.PolygonField()
	featcode = models.PositiveSmallIntegerField(null=True)
	name = models.CharField(max_length=128, null=True)
	address = models.CharField(max_length=255)
	house_nmbr = models.PositiveSmallIntegerField(null=True, blank=True)
	street = models.CharField(max_length=128, null=True, blank=True)
	postcode = models.CharField(max_length=8)
	short_description = models.CharField(max_length=140, null=True, blank=True)
	year_built = models.PositiveSmallIntegerField(null=True)
	count = models.PositiveSmallIntegerField(default=0)
	categories = models.ManyToManyField(Category, blank=True)
	thumbnail = models.ImageField(upload_to=feature_directory_path, null=True, blank=True)
	tags = TaggableManager(blank=True)
	banner = models.ImageField(upload_to=feature_directory_path, null=True, blank=True)

	def __unicode__(self):
		if self.name != None:
			return self.name
		else:
			return self.address


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

	def __unicode__(self):
		return self.feature.name + ' | ' + self.title

	def save(self, *args, **kwargs):
		super(Document, self).save(*args, **kwargs)
		documents = Document.objects.filter(feature=self.feature)
		print(self.feature.id)
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