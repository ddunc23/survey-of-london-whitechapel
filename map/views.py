from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.models import User
from map.models import Feature, Document, Category, Image, Media
from map.serializers import FeatureSerializer
from map.forms import DocumentForm, ImageForm, MediaForm
from rest_framework.renderers import JSONRenderer
from haystack.query import SearchQuerySet
from django.contrib.auth.decorators import login_required
from django.db.models import Q

# Map Views

def home(request):
	"""Base map"""
	features = Feature.objects.all()
	subtitle = '| Map'

	return render(request, 'map/index.html', {'title': 'Survey of London', 'features': features, 'subtitle': subtitle})

def feature(request, feature):
	"""Get info about a single feature"""
	feature = Feature.objects.get(id=feature)
	documents = Document.objects.filter(feature=feature)
	histories = documents.filter(document_type__name='History').order_by('order')
	images = Image.objects.filter(feature=feature)
	media = Media.objects.filter(feature=feature)
	categories = Category.objects.filter(feature=feature)
	if feature.original != None:
		lower = feature.original - 10
		upper = feature.original + 10
	else:
		lower = 0
		upper = 0
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents, 'categories': categories, 'build_range': build_range, 'histories': histories, 'images': images})

def feature_legend(request, feature):
	"""Update the legend control buttons for year, street"""
	feature = Feature.objects.get(id=feature)
	lower = feature.original - 20
	upper = feature.original + 20
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/legendcontrol.html', {'feature': feature, 'build_range': build_range })

def detail(request, feature):
	"""Detailed view of documents and media attached to a single feature"""
	feature = Feature.objects.get(id=feature)
	images = Image.objects.filter(feature=feature).filter(published=True)
	documents = Document.objects.filter(feature=feature).filter(published=True).order_by('order')
	media = Media.objects.filter(feature=feature).filter(published=True)
	histories = documents.filter(document_type__name='History')
	descriptions = documents.filter(document_type__name='Description')
	stories = documents.filter(document_type__name='Story')
	categories = Category.objects.filter(feature=feature)
	similar = feature.tags.similar_objects()
	subtitle = '| ' + str(feature)

	return render(request, 'map/detail.html', {'title': 'Survey of London', 'feature': feature, 'categories': categories, 'histories': histories, 'descriptions': descriptions, 'stories': stories, 'similar': similar, 'subtitle': subtitle, 'images': images, 'media': media})

def category(request, category):
	"""Features by category"""
	category = Category.objects.get(id=category)

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

def all_content_by_author(request, user):
	"""Show all documents, images, and media by a single author. I'll display this as a list for the moment, but should there be a map as well?"""
	user = User.objects.get(id=user)
	features = Feature.objects.filter(Q(document__author=user) | Q(image__author=user)).distinct('id')
	documents = Document.objects.filter(author=user).filter(published=True)
	images = Image.objects.filter(author=user).filter(published=True)

	return render(request, 'map/content_by_author.html', {'user': user, 'documents': documents, 'images': images, 'features': features})



# Users and User Generated Content

@login_required
def user_overview(request, user):
	"""Show an overview of a user's details and documents"""
	user = User.objects.get(username=user)
	documents = Document.objects.filter(author=user)
	published_docs = documents.filter(published=True)
	pending_docs = documents.filter(pending=True)
	draft_docs = documents.filter(published=False)
	images = Image.objects.filter(author=user)
	pending_images = images.filter(pending=True)
	published_images = images.filter(published=True)

	return render(request, 'map/user_overview.html', {'user': user, 'documents': documents, 'published_docs': published_docs, 'draft_docs': draft_docs, 'pending_docs': pending_docs, 'images': images})

@login_required
def ugc_choice(request, feature):
	"""A very simple view to allow users to choose between uploading text or media"""
	feature = Feature.objects.get(id=feature)
	return render(request, 'map/ugc_choice.html', {'feature': feature})

@login_required
def ugc_submit_confirmation(request, feature, document):
	"""Check with the user that they really want to publish a document, because they won't be able to edit it after it's been submitted"""
	pass

@login_required
def ugc_thanks(request, feature):
	"""Another simple view to let users know that they've done something and we're grateful"""
	feature = Feature.objects.get(id=feature)
	return render(request, 'map/ugc_thanks.html', {'feature': feature})

@login_required
def edit_document(request, feature, document=None):
	"""View to allow users to add or edit documents."""
	if document:
		document = Document.objects.get(id=document)
	else:
		document = None

	if request.method == 'POST':
		form = DocumentForm(request.POST, instance=document)
		if form.is_valid():
			d = form.save(commit=False)
			
			try:
				feature = Feature.objects.get(id=feature)
				d.feature = feature
			except Feature.DoesNotExist:
				pass

			d.author = request.user
			if document != None:
				d.id = document.id

			published = request.POST.get('publish')

			if published != None:
				d.pending = True

			d.save()

			if d.pending != True:
				return user_overview(request, request.user.username)
			else:
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		if document == None:
			form = DocumentForm(instance=document)
		else:
			form = DocumentForm(instance=document)
		feature = Feature.objects.get(id=feature)

	return render(request, 'map/add_document.html', {'feature': feature, 'form': form, 'document': document })


@login_required
def edit_image(request, feature, image=None):
	"""View to enable users to upload or edit images"""
	if image:
		document = Image.objects.get(id=document)
	else:
		image = None

	if request.method == 'POST':
		form = ImageForm(request.POST, request.FILES, instance=image)
		if form.is_valid():
			i = form.save(commit=False)
			
			try:
				feature = Feature.objects.get(id=feature)
				i.feature = feature
			except Feature.DoesNotExist:
				pass

			i.author = request.user
			if image != None:
				i.id = i.id

			published = request.POST.get('publish')

			if published != None:
				i.pending = True

			i.file = request.FILES['file']

			i.save()

			if i.pending != True:
				return user_overview(request, request.user.username)
			else:
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		if image == None:
			form = ImageForm(instance=image)
		else:
			form = ImageForm(instance=image)
		feature = Feature.objects.get(id=feature)

	return render(request, 'map/add_image.html', {'feature': feature, 'form': form, 'image': image })


@login_required
def edit_media(request, feature, media=None):
	"""View to enable users to upload or edit media (or rather, media embeds)"""
	if media:
		media = Media.objects.get(id=media)
	else:
		media = None

	if request.method == 'POST':
		form = MediaForm(request.POST, instance=media)
		if form.is_valid():
			m = form.save(commit=False)
			
			try:
				feature = Feature.objects.get(id=feature)
				m.feature = feature
			except Feature.DoesNotExist:
				pass

			m.author = request.user
			if media != None:
				m.id = media.id

			published = request.POST.get('publish')

			if published != None:
				m.pending = True

			m.save()

			if m.pending != True:
				return user_overview(request, request.user.username)
			else:
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		if media == None:
			form = MediaForm()
		else:
			form = MediaForm(initial={'title': 'Add a title (required)', 'url': 'Add a link to a media file (required)'}, instance=document)
		feature = Feature.objects.get(id=feature)

	return render(request, 'map/add_media.html', {'feature': feature, 'form': form, 'media': media })


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
		features = Feature.objects.filter(original__range=[start_date, end_date])
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

def features_by_author(request, author):
	if request.method == 'GET':
		features = Feature.objects.filter(document__author=author)
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
