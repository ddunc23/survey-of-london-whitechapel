from django.shortcuts import render
from map.models import Feature, Document, Story, Category
from whitechapel_pages.models import Page


# Create your views here.

def home(request):
	page = Page.objects.get(is_front_page=True)
	features = page.features.all()
	categories = Category.objects.all()

	for feature in features:
		feature.documents = Document.objects.filter(feature=feature)

	return render(request, 'whitechapel_pages/index.html', { 'page': page, 'title': 'Survey of London', 'subhead': 'Whitechapel', 'features': features, 'categories': categories })