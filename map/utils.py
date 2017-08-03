# Helper functions

from map.models import Feature, Document, Image, Media
from map.serializers import FeatureOverviewSerializer

def building_counts_by_date(date):
	"""
	A helper function that spits out geojson with counts adjusted depending on the date given. Useful for visualising the growth of map contribtions. 
	"""
	features = Feature.objects.all()
	for feature in features:
		d = feature.documents.filter(published=True, created__lte=date, author__is_staff=False).count()
		i = feature.images.filter(published=True, created__lte=date, author__is_staff=False).count()
		m = feature.media.filter(published=True, created__lte=date, author__is_staff=False).count()
		feature.count = d + i + m
	
	serializer = FeatureOverviewSerializer(features, many=True)
	
	return serializer.data
	

def get_similar_features(feature):
	"""
	A helper function that compiles a list of places like the one passed on the basis of the tags attached to the feature and its child documents/images/media.
	"""
	
	# Compile a list of unique tags for the feature
	documents = feature.documents.all()
	images = feature.images.all()
	media = feature.media.all()

	tags = set()

	for document in documents:
		for tag in document.tags.all():
			tags.update([tag])
	for image in images:
		for tag in image.tags.all():
			tags.update([tag])
	for item in media:
		for tag in item.tags.all():
			tags.update([tag])
	for tag in feature.tags.all():
		tags.update([tag])

	similar_features_set = set()

	similar_docs = Document.objects.filter(tags__name__in=tags).distinct()
	similar_images = Image.objects.filter(tags__name__in=tags).distinct()
	similar_media = Media.objects.filter(tags__name__in=tags).distinct()

	for doc in similar_docs:
		similar_features_set.update([doc.feature])
	for img in similar_images:
		similar_features_set.update([img.feature])
	for m in similar_media:
		similar_features_set.update([m.feature])

	similar_features = list(similar_features_set)

	return similar_features
