from whitechapel_pages.models import Page

def menu_links(request):
	menu_links = Page.objects.all().exclude(is_front_page=True)
	return {'menu_links': menu_links}