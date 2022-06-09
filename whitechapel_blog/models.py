from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User
from django.urls import reverse

class Category(models.Model):
	"""A category that blog posts can be categorised in"""
	title = models.CharField(max_length=140, unique=True)
	slug = models.SlugField(unique=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __str__(self):
		return self.title


class Post(models.Model):
	"""A blog post"""
	title = models.CharField(max_length=140)
	slug = models.SlugField(unique=True)
	author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
	body = RichTextUploadingField(blank=True, null=True)
	post_preview = models.CharField(max_length=140, blank=True)
	post_thumbnail = models.ImageField(null=True, blank=True, verbose_name='Thumbnail Image')
	date_created = models.DateField(auto_now_add=True)
	date_published = models.DateField()
	categories = models.ManyToManyField(Category, blank=True)
	# Event listings
	event_date_start = models.DateField(blank=True, null=True, verbose_name='Event start date')
	event_date_end = models.DateField(blank=True, null=True, verbose_name='Event end date')
	event_time = models.TimeField(blank=True, null=True)
	past_event = models.BooleanField(default=False)

	class Meta:
		ordering = ['-date_published']

	def __str__(self):
		return self.title

	def get_absolute_url(self):
		return reverse('single_post', args=[self.date_published.year, self.slug])