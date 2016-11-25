from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.models import Feature, Document, Image, Media

class FeatureSerializer(GeoFeatureModelSerializer):
    categories = serializers.StringRelatedField(many=True)
    site = serializers.StringRelatedField()
    class Meta:
        model = Feature
        geo_field = 'geom'
        fields = ('id', 'b_name', 'address', 'postcode', 'street', 'categories', 'count', 'current', 'site', 'feature_type')

class FeatureDetailSerializer(GeoFeatureModelSerializer):
	categories = serializers.StringRelatedField(many=True)
	site = serializers.StringRelatedField()
	documents = serializers.StringRelatedField(many=True)
	images = serializers.StringRelatedField(many=True)
	media = serializers.StringRelatedField(many=True)
	class Meta:
		model = Feature
		geo_field = 'geom'
		fields = ('id', 'b_name', 'address', 'postcode', 'street', 'categories', 'count', 'current', 'site', 'feature_type', 'documents', 'images', 'media')

class DocumentSerializer(serializers.ModelSerializer):
	author = serializers.StringRelatedField()
	feature = serializers.StringRelatedField()
	class Meta:
		model = Document
		fields = ('id', 'title', 'author', 'feature', 'body', 'created')

class ImageSerializer(serializers.ModelSerializer):
	author = serializers.StringRelatedField()
	feature = serializers.StringRelatedField()
	class Meta:
		model = Image
		fields = ('id', 'title', 'author', 'feature', 'file', 'description', 'copyright', 'created')