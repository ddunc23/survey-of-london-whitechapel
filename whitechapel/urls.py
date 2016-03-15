from django.conf.urls import include, url
from django.contrib import admin
import settings
from django.conf.urls.static import static
from map.models import Feature
from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.serializers import FeatureSerializer

# Django REST Framework Viewsets
class FeatureViewSet(viewsets.ReadOnlyModelViewSet):
	queryset = Feature.objects.all()
	serializer_class = FeatureSerializer

# Django REST Framework Routers
router = routers.DefaultRouter()
router.register(r'features', FeatureViewSet)


urlpatterns = [
    # Examples:
    # url(r'^$', 'map_test.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^map/', include('map.urls')),
    url(r'^', include('whitechapel_pages.urls')),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api/', include(router.urls)),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    # Search
    url(r'^search/', include('haystack.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
