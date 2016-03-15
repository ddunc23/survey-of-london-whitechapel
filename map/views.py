from django.http import HttpResponse
from django.shortcuts import render
from map.models import Feature, Document, Story, Category
from map.serializers import FeatureSerializer
from rest_framework.renderers import JSONRenderer
from haystack.query import SearchQuerySet

# Map Views

def home(request):
	"""Base map"""
	features = Feature.objects.all()

	return render(request, 'map/index.html', {'title': 'Survey of London', 'features': features})

def feature(request, feature):
	"""Get info about a single feature"""
	feature = Feature.objects.get(id=feature)
	documents = Document.objects.filter(feature=feature)
	histories = documents.filter(document_type__name='History').order_by('order')
	stories = Story.objects.filter(feature=feature)
	categories = Category.objects.filter(feature=feature)
	lower = feature.year_built - 10
	upper = feature.year_built + 10
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents, 'categories': categories, 'build_range': build_range, 'histories': histories, 'stories': stories })

def feature_legend(request, feature):
	"""Update the legend control buttons for year, street"""
	feature = Feature.objects.get(id=feature)
	lower = feature.year_built - 20
	upper = feature.year_built + 20
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/legendcontrol.html', {'feature': feature, 'build_range': build_range })

def detail(request, feature):
	"""Detailed view of documents and media attached to a single feature"""
	feature = Feature.objects.get(id=feature)
	documents = Document.objects.filter(feature=feature).order_by('order')
	histories = documents.filter(document_type__name='History')
	descriptions = documents.filter(document_type__name='Description')
	stories = documents.filter(document_type__name='Story')
	categories = Category.objects.filter(feature=feature)
	similar = feature.tags.similar_objects()

	return render(request, 'map/detail.html', {'title': 'Survey of London', 'feature': feature, 'categories': categories, 'histories': histories, 'descriptions': descriptions, 'stories': stories, 'similar': similar })

def category(request, category):
	"""Features by category"""
	category = Category.objects.get(name__iexact=category)

	return render(request, 'map/category.html', {'title': 'Survey of London', 'category': category })

def tag(request, tag):
	"""Feetures by tag"""
	tag = tag

	return render(request, 'map/tag.html', {'title': 'Survey of London', 'tag': tag })

def date_range(request, build_date):
	"""Features by date range"""
	date = int(build_date)
	lower = date - 10
	upper = date + 10
	build_range = {'upper': upper, 'lower': lower}

	return render(request, 'map/date_range.html', {'title': 'Survey of London', 'build_range': build_range }) 

def search_map(request):
	"""Show search results on map"""
	if request.GET['q']:
		query = request.GET['q']

	return render(request, 'map/search_map.html', {'query': query})

# API Views

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

def features(request):
	"""All Features as geoJson"""
	if request.method == 'GET':
		features =  Feature.objects.all()
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_build_date(request, build_date):
	"""Get all Features built in a specific year"""
	if request.method == 'GET':
		features = Feature.objects.filter(year_built=build_date)
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_date_range(request, start_date, end_date):
	"""Get all Features built between two years"""
	if request.method == 'GET':
		features = Feature.objects.filter(year_built__range=[start_date, end_date])
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_street_name(request, street):
	if request.method == 'GET':
		features = Feature.objects.filter(street__contains=street)
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_category(request, category):
	if request.method == 'GET':
		features = Feature.objects.filter(categories__pk=category)
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_tag(request, tag):
	if request.method == 'GET':
		features = Feature.objects.filter(tags__name__in=[tag])
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def search_features(request):
	sqs = SearchQuerySet().all()
	if request.method == 'GET':
		if request.GET['q']:
			results = sqs.filter(content=request.GET['q'])
			features = []
			for result in results:
				features.append(result.object)
			serializer = FeatureSerializer(features, many=True)
			return JSONResponse(serializer.data)
