from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'^$', views.site_home, name='site_home'),
	url(r'^page/(?P<page_slug>[\w-]+)/$', views.page, name='page'),
]