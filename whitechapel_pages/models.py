from django.db import models
# from map.models import Feature, Document
from ckeditor_uploader.fields import RichTextUploadingField


# Create your models here.

class Page(models.Model):
	title = models.CharField(max_length=140)
	body = RichTextUploadingField(blank=True, null=True)
	documents = models.ManyToManyField('map.Document', blank=True)
	features = models.ManyToManyField('map.Feature', blank=True)
	is_front_page = models.BooleanField(default=False)
	banner_image = models.ImageField(blank=True, null=True)

	def __unicode__(self):
		return self.title