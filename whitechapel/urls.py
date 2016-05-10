from django.conf.urls import include, url
from django.contrib import admin
import settings
from django.conf.urls.static import static
from map.models import Feature
from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.serializers import FeatureSerializer
from filebrowser.sites import site

# Django REST Framework Viewsets
class FeatureViewSet(viewsets.ReadOnlyModelViewSet):
	queryset = Feature.objects.all()
	serializer_class = FeatureSerializer

# Django REST Framework Routers
router = routers.DefaultRouter()
router.register(r'features', FeatureViewSet)

urlpatterns = [
    # django-filebrowser
    url(r'^admin/filebrowser/', include(site.urls)),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^map/', include('map.urls')),
    url(r'', include('whitechapel_pages.urls')),
    url(r'^users/', include('whitechapel_users.urls')),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api/', include(router.urls)),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    # Search
    url(r'^search/', include('haystack.urls')),
    # Grappelli
    url(r'^grappelli/', include('grappelli.urls')),
    # django-allauth
    url(r'^accounts/logout/$', 'django.contrib.auth.views.logout',
     {'next_page': '/'}),
    url(r'^accounts/', include('allauth.urls')),
    url(r'^accounts/profile/$', 'whitechapel_users.views.user_profile', name='user_profile'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
