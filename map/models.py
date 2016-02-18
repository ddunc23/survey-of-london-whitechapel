from django.db import models
from djgeojson.fields import PolygonField
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.

class Feature(models.Model):
	osm_id = models.CharField(max_length=128)
	geom = PolygonField()

	def __unicode__(self):
		return self.osm_id

class OS_Feature(models.Model):
	os_id = models.CharField(max_length=128)
	geom = PolygonField()
	address = models.CharField(max_length=255)
	count = models.PositiveSmallIntegerField(default=0)

	def __unicode__(self):
		return self.address

class Document(models.Model):
	os_id = models.ForeignKey(OS_Feature)
	title = models.CharField(max_length=128)
	body = RichTextUploadingField(blank=True)

	def __unicode__(self):
		return self.title

	def save(self, *args, **kwargs):
		super(Document, self).save(*args, **kwargs)
		documents = Document.objects.filter(os_id=self.os_id)
		print(self.os_id.id)
		feature = OS_Feature.objects.get(id=self.os_id.id)
		feature.count = len(documents)
		feature.save()