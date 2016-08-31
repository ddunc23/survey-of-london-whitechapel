from whitechapel_blog.models import Category, Post
import datetime

def blog_category_links(request):
	blog_category_links = Category.objects.all()
	return {'blog_category_links': blog_category_links}


def blog_post_list(request):
	blog_post_list = Post.objects.filter(date_published__lte=datetime.date.today())
	return {'blog_post_list': blog_post_list}
