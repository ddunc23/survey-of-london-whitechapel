from django.conf.urls import include, url
from .views import site_home, page, quick_contribution_acknowledgement, listing
from django_distill import distill_path
from .models import Page

def get_index():
	return None

def get_all_pages():
	for p in Page.objects.all():
		yield {'page_slug': p.slug}

urlpatterns = [
	distill_path('', site_home, name='site_home', distill_func=get_index, distill_file='index.html'),
	distill_path('page/<page_slug>/', page, name='page', distill_func=get_all_pages),
	url(r'^contribution-acknowledgement', quick_contribution_acknowledgement, name='quick_contribution_acknowledgement'),
	url(r'^events/$', listing, name='listings'),
]