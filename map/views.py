from django.shortcuts import render
from map.models import OS_Feature, Document, Story

# Create your views here.

def home(request):
	"""Base map"""
	os_features = OS_Feature.objects.all()

	return render(request, 'map/index.html', {'title': 'Survey of London Whitechapel', 'os_features': os_features})

def feature(request, os_id):
	"""Get info about a single feature"""
	feature = OS_Feature.objects.get(id=os_id)
	documents = Document.objects.filter(os_id=os_id)
	stories = Story.objects.filter(neighbourhood=feature.neighbourhood)

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents, 'stories': stories })

def detail(request, os_id):
	"""Detailed view of documents and media attached to a single feature"""
	feature = OS_Feature.objects.get(id=os_id)
	documents = Document.objects.filter(os_id=os_id)
	stories = Story.objects.filter(neighbourhood=feature.neighbourhood)

	return render(request, 'map/detail.html', {'title': 'Survey of London Whitechapel', 'feature': feature, 'documents': documents, 'stories': stories })