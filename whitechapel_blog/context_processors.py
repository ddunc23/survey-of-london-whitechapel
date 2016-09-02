from whitechapel_blog.models import Category, Post
from map.models import Image, Document, Media
from itertools import chain
from operator import attrgetter
import datetime

def blog_category_links(request):
	blog_category_links = Category.objects.all()
	return {'blog_category_links': blog_category_links}


def blog_post_list(request):
	blog_post_list = Post.objects.filter(date_published__lte=datetime.date.today())
	return {'blog_post_list': blog_post_list}

def latest_contributions(request):
	images = Image.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	documents = Document.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	media = Media.objects.filter(published=True).exclude(created=None).order_by('-created')[:5]
	latest = list(chain(documents, images))
	latest.sort(key=attrgetter('created'), reverse=True)

	return {'latest_map_contributions': latest}