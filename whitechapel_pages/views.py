from django.shortcuts import render, get_object_or_404
from map.models import Feature, Document, Category, Image, Media
from whitechapel_blog.models import Post
from whitechapel_pages.models import Page
from itertools import chain
from operator import attrgetter
import datetime
from django.contrib.sitemaps import Sitemap

def site_home(request):
	"""The front page of the website"""
	page = Page.objects.get(is_front_page=True)
	categories = Category.objects.all().order_by('name')
	images = Image.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	documents = Document.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	media = Media.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	posts = Post.objects.filter(date_published__lte=datetime.date.today()).exclude(categories__slug__iexact='events')[:3]

	latest = list(chain(documents, images))
	latest.sort(key=attrgetter('created'), reverse=True)

	return render(request, 'whitechapel_pages/index.html', {'page': page, 'title': 'Survey of London', 'subhead': 'Whitechapel', 'categories': categories, 'images': images, 'documents': documents, 'media': media, 'latest': latest[:5], 'posts': posts })

def page(request, page_slug):
	"""Any other page"""
	page = Page.objects.get(slug=page_slug)

	return render(request, 'whitechapel_pages/page.html', {'page': page})

# Sitemap

class PageSitemap(Sitemap):
	priority = 0.6
	protocol = 'https'

	def items(self):
		return Page.objects.all().exclude(is_front_page=True)

class FrontPageSitemap(Sitemap):
	priority = 1
	protocol = 'https'
	location = '/'

	def items(self):
		return Page.objects.filter(is_front_page=True)
