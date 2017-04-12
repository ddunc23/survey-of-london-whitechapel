from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.models import Feature, Document, Image, Media
from django.contrib.auth.models import User

class UserSerializer(serializers.GeoFeatureModelSerializer):
	class Meta:
		model = User
		fields = ('id', 'username')
		geo_field = 'geom'

class FeatureOverviewSerializer(serializers.ModelSerializer):
	class Meta:
		model = Feature
		fields = ('id', 'b_number', 'b_name', 'street', 'address', 'feature_type', 'count')

class ImageSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	feature = FeatureOverviewSerializer()
	class Meta:
		model = Image
		fields = ('id', 'title', 'author', 'feature', 'file', 'description', 'copyright', 'created')

class DocumentSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	feature = FeatureOverviewSerializer()
	class Meta:
		model = Document
		depth = 2
		fields = ('id', 'title', 'author', 'feature', 'body', 'created', 'last_edited')

class MediaSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	feature = FeatureOverviewSerializer()
	class Meta:
		model = Media
		fields = ('id', 'title', 'author', 'feature', 'url')

class ImageOverviewSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	class Meta:
		model = Image
		fields = ('id', 'title', 'author')

class DocumentOverviewSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	class Meta:
		model = Document
		depth = 2
		fields = ('id', 'title', 'author')

class MediaOverviewSerializer(serializers.ModelSerializer):
	author = UserSerializer()
	class Meta:
		model = Media
		fields = ('id', 'title', 'author')

class FeatureSerializer(GeoFeatureModelSerializer):
    documents = DocumentOverviewSerializer(many=True)
    images = ImageOverviewSerializer(many=True)
    media = MediaOverviewSerializer(many=True)
    class Meta:
        model = Feature
        depth = 2
        geo_field = 'geom'
        fields = ('id', 'b_name', 'address', 'postcode', 'street', 'categories', 'count', 'current', 'site', 'feature_type', 'documents', 'images', 'media')