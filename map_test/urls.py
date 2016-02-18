from django.conf.urls import include, url
from django.contrib import admin
import settings
from django.conf.urls.static import static


urlpatterns = [
    # Examples:
    # url(r'^$', 'map_test.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('map.urls')),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
