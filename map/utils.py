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
	