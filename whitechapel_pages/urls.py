from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'$^', views.home, name='home'),
	url(r'^(?P<slug>\w+)/$', views.page, name='page'),
]