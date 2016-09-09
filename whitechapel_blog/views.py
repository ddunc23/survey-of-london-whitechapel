from django.shortcuts import render, get_object_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView, DetailView
from whitechapel_blog.models import Post, Category
from django.contrib.auth.models import User
import datetime
from django.contrib.sitemaps import Sitemap

class PostList(ListView):
	queryset = Post.objects.filter(date_published__lte=datetime.date.today())
	context_object_name = 'posts'
	paginate_by = 10
	template_name = 'whitechapel_blog/index.html'


def single_post(request, year, post):
	"""A single post"""
	post = get_object_or_404(Post, slug=post, date_published__year=year)

	return render(request, 'whitechapel_blog/single_post.html', {'post': post})


def posts_by_year(request, year):
	"""All posts in a particular year"""
	posts = Post.objects.filter(date_published__lte=datetime.date.today()).filter(date_published__year=year)
	paginator = Paginator(posts, 10)

	page = request.GET.get('page')
	
	try:
		posts = paginator.page(page)
	except PageNotAnInteger:
		posts = paginator.page(1)
	except EmptyPage:
		posts = paginator.page(paginator.num_pages)

	return render(request, 'whitechapel_blog/year_archive.html', {'posts': posts, 'year': year})


def posts_by_category(request, category):
	"""All posts in a single category"""
	
	category = get_object_or_404(Category, slug=category)

	posts = Post.objects.filter(date_published__lte=datetime.date.today()).filter(categories=category)
	paginator = Paginator(posts, 10)
	
	page = request.GET.get('page')
	
	try:
		posts = paginator.page(page)
	except PageNotAnInteger:
		posts = paginator.page(1)
	except EmptyPage:
		posts = paginator.page(paginator.num_pages)

	return render(request, 'whitechapel_blog/category_archive.html', {'posts': posts, 'category': category})


def posts_by_author(request, author):
	"""All posts in a particular author"""
	author = get_object_or_404(User, id=author)

	posts = Post.objects.filter(date_published__lte=datetime.date.today()).filter(author=author)
	paginator = Paginator(posts, 10)

	page = request.GET.get('page')
	
	try:
		posts = paginator.page(page)
	except PageNotAnInteger:
		posts = paginator.page(1)
	except EmptyPage:
		posts = paginator.page(paginator.num_pages)

	return render(request, 'whitechapel_blog/author_archive.html', {'posts': posts, 'author': author})


# Sitemap

class BlogPostSitemap(Sitemap):
	priority = 0.7

	def lastmod(self, obj):
		return obj.date_published

	def items(self):
		return Post.objects.filter(date_published__lte=datetime.date.today())
