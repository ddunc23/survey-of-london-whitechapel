from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.auth.models import User


class Category(models.Model):
	"""A category that blog posts can be categorised in"""
	title = models.CharField(max_length=140, unique=True)
	slug = models.SlugField(unique=True)

	class Meta:
		verbose_name_plural = "Categories"

	def __unicode__(self):
		return self.title


class Post(models.Model):
	"""A blog post"""
	title = models.CharField(max_length=140)
	slug = models.SlugField(unique=True)
	author = models.ForeignKey(User)
	body = RichTextUploadingField(blank=True, null=True)
	date_created = models.DateField(auto_now_add=True)
	date_published = models.DateField()
	categories = models.ManyToManyField(Category, blank=True)

	class Meta:
		ordering = ['-date_published']

	def __unicode__(self):
		return self.title