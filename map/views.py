from django.shortcuts import render
from map.models import Feature, OS_Feature, Document

# Create your views here.

def home(request):
	"""Base map"""
	features = Feature.objects.all()
	os_features = OS_Feature.objects.all()

	return render(request, 'map/index.html', {'title': 'Survey of London Whitechapel', 'features': features, 'os_features': os_features})

def feature(request, id):
	"""Get info about a single feature"""
	feature = OS_Feature.objects.get(id=id)
	documents = Document.objects.filter(os_id=feature)

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents })