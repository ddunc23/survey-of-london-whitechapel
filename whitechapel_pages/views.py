from django.shortcuts import render
from map.models import Feature, Document, Category, Image
from whitechapel_pages.models import Page


def home(request):
	"""The front page of the website"""
	page = Page.objects.get(is_front_page=True)
	features = page.features.all()
	categories = Category.objects.all()
	images = Image.objects.filter(published=True).order_by('last_edited')[:5]

	for feature in features:
		feature.documents = Document.objects.filter(feature=feature)

	return render(request, 'whitechapel_pages/index.html', {'page': page, 'title': 'Survey of London', 'subhead': 'Whitechapel', 'features': features, 'categories': categories, 'images': images})

def page(request, slug):
	"""Any other page"""
	page = Page.objects.get(slug=slug)

	return render(request, 'whitechapel_pages/page.html', {'page': page})