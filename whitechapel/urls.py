# Django Core
from django.contrib.sitemaps.views import sitemap
from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

# Whitechapel
from map.views import MapSitemap, QueryFeatures, QueryDocuments, QueryImages, QueryMedia
from map.models import Feature, Document, Image, Media
from whitechapel_pages.views import PageSitemap, FrontPageSitemap
from whitechapel_blog.views import BlogPostSitemap
from map.serializers import FeatureSerializer, DocumentSerializer, ImageSerializer, MediaSerializer

# 3rd Party
from filebrowser.sites import site
from honeypot.decorators import check_honeypot
from allauth import account
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from rest_framework.pagination import PageNumberPagination

# Django REST Framework Pagination
class StandardResultsSetPagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = 'page_size'
    max_page_size = 100

# Django REST Framework Viewsets
class FeatureViewSet(viewsets.ReadOnlyModelViewSet):
    #authentication_classes = (SessionAuthentication, BasicAuthentication)
    queryset = Feature.objects.all()
    serializer_class = FeatureSerializer
    pagination_class = StandardResultsSetPagination

class DocumentViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Document.objects.filter(published=True)
    serializer_class = DocumentSerializer
    pagination_class = StandardResultsSetPagination

class ImageViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Image.objects.filter(published=True)
    serializer_class = ImageSerializer
    pagination_class = StandardResultsSetPagination

class MediaViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Media.objects.filter(published=True)
    serializer_class = MediaSerializer
    pagination_class = StandardResultsSetPagination

# Django REST Framework Routers
router = routers.DefaultRouter()
router.register(r'features', FeatureViewSet)
router.register(r'documents', DocumentViewSet)
router.register(r'images', ImageViewSet)
router.register(r'media', MediaViewSet)

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
    url(r'^api/v1/', include(router.urls)),
    url(r'^api/v1/query/features/$', QueryFeatures.as_view(), name='query_features'),
    url(r'^api/v1/query/documents/$', QueryDocuments.as_view(), name='query_documents'),
    url(r'^api/v1/query/images/$', QueryImages.as_view(), name='query_images'),
    url(r'^api/v1/query/media/$', QueryMedia.as_view(), name='query_media'),
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
    # Temporarily redirect profile page to maintenance mode
    # url(r'^accounts/profile/$', 'whitechapel_users.views.user_profile', name='user_profile'),
    url(r'^accounts/profile/$', 'map.views.maintenance_profile', name='user_profile'),
    url(r'^sitemap\.xml$', sitemap, {'sitemaps': sitemaps},
    name='django.contrib.sitemaps.views.sitemap'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    # urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += staticfiles_urlpatterns()
