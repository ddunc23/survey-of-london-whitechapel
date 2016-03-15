from haystack import indexes
from map.models import Feature, Document, Story

class FeatureIndex(indexes.SearchIndex, indexes.Indexable):
	text = indexes.CharField(document=True, use_template=True)
	address = indexes.CharField(model_attr='address')
	street = indexes.CharField(model_attr='street', null=True)
	postcode = indexes.CharField(model_attr='postcode')
	name = indexes.CharField(model_attr='name', null=True)
	tags = indexes.MultiValueField()

	def get_model(self):
		return Feature

	def index_queryset(self, using=None):
		"""Used when the entire index for model is updated."""
		return self.get_model().objects.all()