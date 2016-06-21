from whitechapel_pages.models import Page
from map.models import Category
from django.db.models import Count

def menu_links(request):
	menu_links = Page.objects.all().exclude(is_front_page=True)
	return {'menu_links': menu_links}

def category_links(request):
	category_links = Category.objects.annotate(feature_count=Count('feature')).filter(feature_count__gte=1)
	return {'category_links': category_links}