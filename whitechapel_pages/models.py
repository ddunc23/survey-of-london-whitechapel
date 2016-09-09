from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from filebrowser.fields import FileBrowseField
from django.core.urlresolvers import reverse

class Page(models.Model):
	"""An HTML page, with the capacity for adding featured content if it's the front page."""
	title = models.CharField(max_length=140)
	slug = models.SlugField()
	body = RichTextUploadingField(blank=True, null=True)
	documents = models.ManyToManyField('map.Document', blank=True)
	blog_post = models.ForeignKey('whitechapel_blog.Post', blank=True, null=True, verbose_name='Featured Event')
	images = models.ManyToManyField('map.Image', blank=True)
	media = models.ManyToManyField('map.Media', blank=True)
	is_front_page = models.BooleanField(default=False)
	banner_image_1 = models.ImageField(blank=True, null=True)
	banner_image_2 = models.ImageField(blank=True, null=True)
	banner_image_3 = models.ImageField(blank=True, null=True)

	def __unicode__(self):
		return self.title

	def get_absolute_url(self):
		return reverse('page', args=[self.slug])