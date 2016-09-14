from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.models import Feature

class FeatureSerializer(GeoFeatureModelSerializer):
    #categories = serializers.StringRelatedField(many=True)
    #site = serializers.StringRelatedField()
    class Meta:
        model = Feature
        geo_field = 'geom'
        fields = ('id', 'b_name', 'address', 'count', 'current', 'feature_type')