from django.shortcuts import render
from map.models import Feature, Document, Story

# Create your views here.

def home(request):
	"""Base map"""
	features = Feature.objects.all()

	return render(request, 'map/index.html', {'title': 'Survey of London Whitechapel', 'features': features})

def features(request):
	"""All Features as geoJson"""
	features = Feature.objects.all()

	return render(request, 'map/features.json', {'features': features })

def feature(request, feature):
	"""Get info about a single feature"""
	feature = Feature.objects.get(id=feature)
	documents = Document.objects.filter(feature=feature)

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents })

def detail(request, feature):
	"""Detailed view of documents and media attached to a single feature"""
	feature = Feature.objects.get(id=feature)
	documents = Document.objects.filter(feature=feature)

	return render(request, 'map/detail.html', {'title': 'Survey of London Whitechapel', 'feature': feature, 'documents': documents })