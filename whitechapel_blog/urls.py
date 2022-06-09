from django.conf.urls import include, url
from .views import PostList, single_post, posts_by_year, posts_by_author, posts_by_category
from django_distill import distill_path

from .models import Post, Category

def get_index():
	return None

def get_years():
	years = []
	for p in Post.objects.all():
		if p.date_published.year not in years:
			years.append(p.date_published.year)
	for y in years:
		yield {'year': y}

def get_posts():
	for p in Post.objects.all():
		yield {'post': p.slug, 'year': p.date_published.year}

def get_authors():
	for p in Post.objects.all():
		yield {'author': p.author.id}

def get_categories():
	for c in Category.objects.all():
		yield {'category': c.slug}

urlpatterns = [
	distill_path('', PostList.as_view(), name='blog', distill_func=get_index),
	distill_path('<year>/<post>/', single_post, name='single_post', distill_func=get_posts),
	distill_path('archives/year/<year>/', posts_by_year, name='posts_by_year', distill_func=get_years),
	distill_path('archives/author/<author>/', posts_by_author, name='posts_by_author', distill_func=get_authors),
	distill_path('archives/category/<category>/', posts_by_category, name='posts_by_category', distill_func=get_categories),
]