from django.conf.urls import include, url
import views

urlpatterns = [
    # Examples:
    # url(r'^$', 'map_test.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'$^', views.home, name='home'),
    url(r'feature/(?P<os_id>\d+)/$', views.feature, name='feature'),
    url(r'feature/(?P<os_id>\d+)/detail/$', views.detail, name='detail'),
]