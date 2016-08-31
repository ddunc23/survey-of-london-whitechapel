from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'^$', views.PostList.as_view(), name='blog'),
	url(r'^(?P<year>\d+)/(?P<post>[-\w]+)/$', views.single_post, name='single_post'),
	url(r'^archives/year/(?P<year>\d+)/$', views.posts_by_year, name='posts_by_year'),
	url(r'^archives/author/(?P<author>\d+)/$', views.posts_by_author, name='posts_by_author'),
	url(r'^archives/category/(?P<category>\w+)$', views.posts_by_category, name='posts_by_category'),
]