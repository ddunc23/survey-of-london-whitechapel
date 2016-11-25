from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from map.models import Feature, Document, Image, Media
from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.serializers import FeatureSerializer, FeatureDetailSerializer, DocumentSerializer, ImageSerializer
from filebrowser.sites import site
from django.contrib.sitemaps.views import sitemap
from map.views import MapSitemap
from whitechapel_pages.views import PageSitemap, FrontPageSitemap
from whitechapel_blog.views import BlogPostSitemap
from honeypot.decorators import check_honeypot
from allauth import account

# Django REST Framework Viewsets
class FeatureViewSet(viewsets.ReadOnlyModelViewSet):
	queryset = Feature.objects.all()
	serializer_class = FeatureSerializer

class FeatureDetailViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Feature.objects.all()
    serializer_class = FeatureDetailSerializer

class DocumentViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Document.objects.all()
    serializer_class = DocumentSerializer

class ImageViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Image.objects.all()
    serializer_class = ImageSerializer

# Django REST Framework Routers
router = routers.DefaultRouter()
router.register(r'features', FeatureViewSet)
router.register(r'detail', FeatureDetailViewSet)
router.register(r'document', DocumentViewSet)
router.register(r'image', ImageViewSet)

# Sitemaps
sitemaps = {
    'features': MapSitemap,
    'pages': PageSitemap,
    'front_page': FrontPageSitemap,
    'posts': BlogPostSitemap,
}

urlpatterns = [
    url(r'^survey-of-london-whitechapel-admin-site/', include(admin.site.urls)),
    url(r'^map/', include('map.urls')),
    url(r'', include('whitechapel_pages.urls')),
    url(r'^blog/', include('whitechapel_blog.urls')),
    url(r'^users/', include('whitechapel_users.urls')),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^api/', include(router.urls)),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
    # django-filebrowser
    url(r'^admin/filebrowser/', include(site.urls)),
    # Search
    url(r'^search/', include('haystack.urls')),
    # Grappelli
    url(r'^grappelli/', include('grappelli.urls')),
    # django-allauth
    url(r'^accounts/logout/$', 'django.contrib.auth.views.logout',
     {'next_page': '/'}),
    url(r'^accounts/login/$', check_honeypot(account.views.login)),
    url(r'^accounts/', include('allauth.urls')),
    url(r'^accounts/profile/$', 'whitechapel_users.views.user_profile', name='user_profile'),
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps},
    name='django.contrib.sitemaps.views.sitemap'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)