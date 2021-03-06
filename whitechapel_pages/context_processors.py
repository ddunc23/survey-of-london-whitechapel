from whitechapel_pages.models import Page
from map.models import Category
from django.db.models import Count
from django.conf import settings

def menu_links(request):
	menu_links = Page.objects.all().exclude(is_front_page=True).order_by('title')
	return {'menu_links': menu_links}

def category_links(request):
	category_links = Category.objects.annotate(feature_count=Count('feature')).filter(feature_count__gte=1).order_by('name')
	return {'category_links': category_links}

def allow_indexing(request):
	allow_indexing = settings.ALLOW_INDEXING
	return {'allow_indexing': allow_indexing}