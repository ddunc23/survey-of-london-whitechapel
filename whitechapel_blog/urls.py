from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'^$', views.PostList.as_view(), name='blog'),
]