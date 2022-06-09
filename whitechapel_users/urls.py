from django.conf.urls import include, url
from .views import check_first_login, gdpr_prompt

urlpatterns = [
	url(r'^login-check/$', check_first_login, name='check_first_login'),
	url(r'^gdpr_prompt/$', gdpr_prompt, name='gdpr_prompt')
]