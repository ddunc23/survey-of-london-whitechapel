from haystack import indexes
from map.models import Feature, Document, Image, Media
from django.contrib.auth.models import User

class FeatureIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)

	def get_model(self):
		return Feature

	def index_queryset(self, using=None):
		"""Used when the entire index for model is updated."""
		return self.get_model().objects.all()


class DocumentIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)
	title = indexes.CharField(model_attr='title')
	body = indexes.CharField(model_attr='body')
	published = indexes.BooleanField(model_attr='published')

	def get_model(self):
		return Document

	def index_queryset(self, using=None):
		return self.get_model().objects.all()


class ImageIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)
	title = indexes.CharField(model_attr='title')
	description = indexes.CharField(model_attr='description', null=True)
	published = indexes.BooleanField(model_attr='published')

	def get_model(self):
		return Image

	def index_queryset(self, using=None):
		return self.get_model().objects.all()


class MediaIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)
	title = indexes.CharField(model_attr='title')
	description = indexes.CharField(model_attr='description', null=True)
	published = indexes.BooleanField(model_attr='published')

	def get_model(self):
		return Media

	def index_queryset(self, using=None):
		return self.get_model().objects.all()



class UserIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)
	username = indexes.CharField(model_attr='username')

	def get_model(self):
		return User

	def index_queryset(self, using=None):
		return self.get_model().objects.all()