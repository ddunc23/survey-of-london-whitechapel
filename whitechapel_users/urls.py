from django.conf.urls import include, url
import views

urlpatterns = [
	url(r'^login-check/$', views.check_first_login, name='check_first_login'),
	url(r'^gdpr_prompt/$', views.gdpr_prompt, name='gdpr_prompt')
]