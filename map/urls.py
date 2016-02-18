from django.conf.urls import include, url
import views

urlpatterns = [
    # Examples:
    # url(r'^$', 'map_test.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'$^', views.home, name='home'),
    url(r'feature/(?P<id>\d+)/$', views.feature, name='feature'),
]