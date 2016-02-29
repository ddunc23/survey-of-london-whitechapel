from django.db import models
from djgeojson.fields import PolygonField
from ckeditor_uploader.fields import RichTextUploadingField

def feature_directory_path(instance, filename):
	"""File will be uploaded to /uploads/features/<feature.id>/filename"""
	return 'uploads/features/{0}/{1}'.format(instance.id, filename)

class Category(models.Model):
	name = models.CharField(max_length=128)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.name

class Feature(models.Model):
	os_id = models.CharField(max_length=128)
	geom = PolygonField()
	featcode = models.PositiveSmallIntegerField(null=True)
	name = models.CharField(max_length=128, null=True)
	address = models.CharField(max_length=255)
	postcode = models.CharField(max_length=8)
	short_description = models.CharField(max_length=140, null=True)
	year_built = models.PositiveSmallIntegerField(null=True)
	count = models.PositiveSmallIntegerField(default=0)
	categories = models.ManyToManyField(Category, blank=True)
	thumbnail = models.ImageField(upload_to=feature_directory_path, null=True, blank=True)

	def __unicode__(self):
		if self.name != None:
			return self.name
		else:
			return self.address


class Document(models.Model):
	feature = models.ForeignKey(Feature)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=True)
	start_year = models.PositiveSmallIntegerField(null=True)
	end_year = models.PositiveSmallIntegerField(null=True)

	def __unicode__(self):
		return self.title

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