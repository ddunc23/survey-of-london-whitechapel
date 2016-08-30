from whitechapel_blog.models import Category, Post
import datetime

def blog_category_links(request):
	blog_category_links = Category.objects.all()
	return {'blog_category_links': blog_category_links}