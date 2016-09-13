from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'^check_first_login/$', views.check_first_login, name='check_first_login')
]