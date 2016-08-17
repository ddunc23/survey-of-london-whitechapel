from django.db import models
# from map.models import Feature, Document
from ckeditor_uploader.fields import RichTextUploadingField
from filebrowser.fields import FileBrowseField

class Page(models.Model):
	"""An HTML page, with the capacity for adding featured content if it's the front page."""
	title = models.CharField(max_length=140)
	slug = models.SlugField()
	body = RichTextUploadingField(blank=True, null=True)
	documents = models.ManyToManyField('map.Document', blank=True)
	features = models.ManyToManyField('map.Feature', blank=True)
	images = models.ManyToManyField('map.Image', blank=True)
	media = models.ManyToManyField('map.Media', blank=True)
	is_front_page = models.BooleanField(default=False)
	banner_image_1 = models.ImageField(blank=True, null=True)
	banner_image_2 = models.ImageField(blank=True, null=True)
	banner_image_3 = models.ImageField(blank=True, null=True)

	def __unicode__(self):
		return self.title