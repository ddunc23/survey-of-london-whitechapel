from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from filebrowser.fields import FileBrowseField
from django.core.urlresolvers import reverse

# Other python modules
import bleach

class Page(models.Model):
	"""An HTML page, with the capacity for adding featured content if it's the front page."""
	title = models.CharField(max_length=140)
	slug = models.SlugField()
	body = RichTextUploadingField(blank=True, null=True)
	documents = models.ManyToManyField('map.Document', blank=True)
	building_of_the_week = models.ForeignKey('map.Feature', blank=True, null=True, verbose_name='Building of the Week')
	blog_post = models.ForeignKey('whitechapel_blog.Post', blank=True, null=True, verbose_name='Featured Event')
	images = models.ManyToManyField('map.Image', blank=True)
	media = models.ManyToManyField('map.Media', blank=True)
	is_front_page = models.BooleanField(default=False)
	banner_image_1 = models.ImageField(blank=True, null=True)
	banner_image_2 = models.ImageField(blank=True, null=True)
	banner_image_3 = models.ImageField(blank=True, null=True)
	banner_image_4 = models.ImageField(blank=True, null=True)

	def __unicode__(self):
		return self.title

	def get_absolute_url(self):
		return reverse('page', args=[self.slug])


class QuickContribution(models.Model):
	"""
	A quick contribution to the website from a user who doesn't want to sign up
	"""
	name = models.CharField(max_length=140)
	email = models.EmailField()
	text = models.TextField()
	location = models.CharField(max_length=200, blank=True)
	date_submitted = models.DateTimeField(auto_now_add=True)

	def __unicode__(self):
		return self.name + ' | ' + str(self.date_submitted)

	def save(self, *args, **kwargs):
		# Sanitise user input
		self.text = bleach.clean(self.text)
		self.name = bleach.clean(self.name)
		self.location = bleach.clean(self.location)
		super(QuickContribution, self).save(*args, **kwargs)
