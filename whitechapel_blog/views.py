from django.shortcuts import render
from django.views.generic import ListView
from whitechapel_blog.models import Post, Category
import datetime

class PostList(ListView):
	queryset = Post.objects.filter(date_published__lte=datetime.date.today())
	context_object_name = 'posts'
	paginate_by = 10
	template_name = 'whitechapel_blog/index.html'

