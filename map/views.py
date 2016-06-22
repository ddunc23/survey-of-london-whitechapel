from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from map.models import Feature, Document, Category, Image, Media, Site
from map.serializers import FeatureSerializer
from map.forms import DocumentForm, ImageForm, MediaForm, AdminDocumentForm, AdminImageForm, AdminMediaForm
from rest_framework.renderers import JSONRenderer
from haystack.query import SearchQuerySet
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.views.decorators.cache import cache_page
from itertools import chain
import logging
from taggit.models import Tag
from django.core.mail import mail_managers, send_mail
import re
from django.template import Context
from datetime import datetime, timedelta

logger = logging.getLogger(__name__)


# Map Views

def map_home(request):
	"""Base map"""
	features = Feature.objects.all()
	subtitle = '| Map'
	first_visit = None
	try:
		request.session['has_visited']
	except KeyError:
		first_visit = True
		request.session['has_visited'] = True

	
	last_feature = request.GET.get('last_feature')
	if last_feature is not None and last_feature !='':
		last_feature = int(last_feature)
		return HttpResponseRedirect(reverse('ugc_choice', args=(last_feature,)))
	else:
		pass

	return render(request, 'map/index.html', {'title': 'Survey of London', 'features': features, 'subtitle': subtitle, 'first_visit': first_visit })


def feature(request, feature):
	"""Get info about a single feature"""
	feature = get_object_or_404(Feature, id=feature)

	if feature.site != None:
		documents = Document.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True)
		images = Image.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True)
		media = Media.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True)
	else:
		documents = Document.objects.filter(feature=feature).filter(published=True)
		images = Image.objects.filter(feature=feature).filter(published=True)
		media = Media.objects.filter(feature=feature).filter(published=True)
	
	categories = Category.objects.filter(feature=feature)
	if feature.current != None:
		lower = feature.current - 10
		upper = feature.current + 10
	else:
		lower = 0
		upper = 0
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/feature.html', {'feature': feature, 'documents': documents, 'categories': categories, 'build_range': build_range, 'images': images, 'media': media, })


def feature_legend(request, feature):
	"""Update the legend control buttons for year, street"""
	feature = Feature.objects.get(id=feature)
	if feature.current != None:
		lower = feature.current - 10
		upper = feature.current + 10
	else:
		lower = 0
		upper = 0
	build_range ={'upper': upper, 'lower': lower}

	return render(request, 'map/legendcontrol.html', {'feature': feature, 'build_range': build_range })


def detail(request, feature):
	"""Detailed view of documents and media attached to a single feature"""
	feature = get_object_or_404(Feature, id=feature)
	
	if feature.site != None:
		documents = Document.objects.filter(feature=feature).filter(published=True, aggregate=False)
		images = Image.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True)
		media = Media.objects.filter(Q(feature=feature) | Q(feature__site=feature.site, aggregate=True)).filter(published=True)
		site_docs = Document.objects.filter(feature__site=feature.site, aggregate=True, published=True)
	else:
		documents = Document.objects.filter(feature=feature).filter(published=True)
		images = Image.objects.filter(feature=feature).filter(published=True)
		media = Media.objects.filter(feature=feature).filter(published=True)
		site_docs = None

	histories = documents.filter(document_type='HISTORY')
	descriptions = documents.filter(document_type='DESCRIPTION')
	stories = documents.filter(document_type='STORY')
	categories = Category.objects.filter(feature=feature)
	similar = feature.tags.similar_objects()
	subtitle = '| ' + str(feature)
	tags = []
	
	for document in documents:
		for tag in document.tags.all():
			tags.append(tag)
	for image in images:
		for tag in image.tags.all():
			tags.append(tag)
	for item in media:
		for tag in item.tags.all():
			tags.append(tag)
	for tag in feature.tags.all():
		tags.append(tag)

	return render(request, 'map/detail.html', {'title': 'Survey of London', 'feature': feature, 'categories': categories, 'histories': histories, 'descriptions': descriptions, 'stories': stories, 'similar': similar, 'subtitle': subtitle, 'images': images, 'media': media, 'tags': tags, 'site_docs': site_docs })


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
def user_overview(request):
	"""Show an overview of a user's details and documents"""
	user = request.user
	documents = Document.objects.filter(author=user)
	published_docs = documents.filter(published=True)
	pending_docs = documents.filter(pending=True)
	draft_docs = documents.filter(published=False).filter(pending=False)
	images = Image.objects.filter(author=user)
	pending_images = images.filter(pending=True)
	published_images = images.filter(published=True)

	return render(request, 'map/user_overview.html', {'user': user, 'documents': documents, 'published_docs': published_docs, 'draft_docs': draft_docs, 'pending_docs': pending_docs, 'images': images, 'pending_images': pending_images})

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
def dashboard(request):
	"""An overview of new submissions, users, and useful statistics"""
	if request.user.is_staff == False:
		raise Http404("Staff Only!")
	
	documents = Document.objects.all().order_by('-last_edited')
	images = Image.objects.all().order_by('-last_edited')
	media = Media.objects.all().order_by('-last_edited')
	new_users = User.objects.filter(date_joined__gte=datetime.now()-timedelta(days=14))
	users = User.objects.all()
	for user in users:
		user.contributions = len(Document.objects.filter(author=user)) + len(Image.objects.filter(author=user)) + len(Media.objects.filter(author=user))

	return render(request, 'map/dashboard.html', {'documents': documents, 'images': images, 'media': media, 'new_users': new_users, 'users': users})


def inform_managers_of_content_submission(request):
	"""Tell the SoL admins that a new document has been submitted."""
	message = 'Hello Survey of London Editors.\nNew content has been submitted by ' + request.user.get_username() + ' and is awaiting moderation.\nThank you.'
	html_message = '<p>Hello Survey of London Editors.</p><p>New content has been submitted by ' + request.user.get_username() + ' and is awaiting moderation. To review, edit, and approve it, click <a href="https://surveyoflondon.org/map/dashboard/">here</a>.</p><p>Thank you.</p>'
	mail_managers('New Content Submitted', message=message, html_message=html_message)


def inform_user_of_content_publication(author, title, editor, message):
	"""Tell a contributor that their content has been published and copy in the editor who approved it"""
	if message != '':
		message = 'Hello ' + author.get_username() + '.\nYour recent submission titled "' + title + '" has just been published on the Survey of London Whitechapel Website.\n' + message + '\nThanks for your contribution.'
	else:
		message = 'Hello ' + author.get_username() + '.\nYour recent submission titled "' + title + '" has just been published on the Survey of London Whitechapel Website.\nThanks for your contribution.'

	# recipient_list = [author.email, editor.email]
	# For the moment, just email the editor - we need to get this right before we start sending automated emails willy-nilly

	recipient_list = [editor.email]

	send_mail(subject='Your Content has been Published', message=message, from_email='admin@surveyoflondon.org', recipient_list=recipient_list)


@login_required
def moderate_document(request, document):
	"""View to allow administrators to edit and approve documents."""
	if request.user.is_staff == False:
		raise Http404('Document does not exist')

	document = get_object_or_404(Document, id=document)

	if request.method == 'POST':
		"""Save the form if the request is a POST"""
		form = AdminDocumentForm(request.POST, instance=document)

		if form.is_valid():
			d = form.save(commit=False)

			published = request.POST.get('publish')

			if published != None:
				"""If the published checkbox isn't ticked (which it won't be an unless an editor's seen and checked it, put the document in pending."""
				if published == 'Approve':
					d.pending = False
				else:
					d.pending = True

			d.save()
			form.save_m2m()

			if published == 'Approve':
				"""If the 'published' box is checked, email the contributor to say thanks, otherwise just return the editor to the dashboard"""
				editor = request.user
				message = request.POST.get('email_thanks')
				inform_user_of_content_publication(d.author, d.title, editor, message)
				return dashboard(request)
			else:
				return dashboard(request)

	else:
		"""Display the form with its content if request is a GET"""
		form = AdminDocumentForm(instance=document)

	return render(request, 'map/moderate_document.html', {'form': form, 'document': document })



@login_required
def edit_document(request, feature, document=None):
	"""View to allow users to add or edit documents."""
	if document:
		"""If the document exits, edit that document, otherwise present the user with a blank form"""
		document = Document.objects.get(id=document)
	else:
		document = None

	if request.method == 'POST':
		"""If request type is a 'POST', save the form"""

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
				"""If there's no 'published' value, place the document in pending"""
				d.pending = True

			### Regex to get select2 tags working - fix fix fix!

			#data = form.cleaned_data['tags']
			#string = ', '.join(data)
			#uni = re.sub(r'u"|u\'|[\[\]"\']', '', string)
			#form.cleaned_data['tags'] = repr(uni)
			# form.cleaned_data['tags'] = data

			d.save()
			form.save_m2m()

			if d.pending != True:
				return user_overview(request)
			else:
				inform_managers_of_content_submission(request)
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		form = DocumentForm(instance=document)	
		feature = Feature.objects.get(id=feature)

	tags = Tag.objects.all()

	return render(request, 'map/add_document.html', {'feature': feature, 'form': form, 'document': document, 'tags': tags, })


@login_required
def moderate_image(request, image):
	"""View to allow administrators to moderate images"""
	if request.user.is_staff == False:
		raise Http404('Image does not exist')

	image = get_object_or_404(Image, id=image)

	if request.method == 'POST':
		"""Save the form if the request is a POST"""
		form = AdminImageForm(request.POST, instance=image)
		i = form.save(commit=False)

		if form.is_valid():
			published = request.POST.get('publish')

			if published != None:
				"""If the published checkbox isn't ticked (which it won't be an unless an editor's seen and checked it, put the document in pending."""
				if published == 'Approve':
					i.pending = False
				else:
					i.pending = True

			i.save()
			form.save_m2m()

			if published == 'Approve':
				"""If the 'published' box is checked, email the contributor to say thanks, otherwise just return the editor to the dashboard"""
				editor = request.user
				message = request.POST.get('email_thanks')
				inform_user_of_content_publication(i.author, i.title, editor, message)
				return dashboard(request)
			else:
				return dashboard(request)

	else:
		"""Display the form with its content if request is a GET"""
		form = AdminImageForm(instance=image)

	return render(request, 'map/moderate_image.html', {'form': form, 'image': image })


@login_required
def edit_image(request, feature, image=None):
	"""View to enable users to upload or edit images"""
	if image:
		image = Image.objects.get(id=image)
		if request.user != image.author:
			raise Http404("Image does not exist")
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
			form.save_m2m()

			if i.pending != True:
				return user_overview(request)
			else:
				inform_managers_of_content_submission(request)
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		if image == None:
			form = ImageForm(instance=image)
		else:
			form = ImageForm(instance=image)
		feature = Feature.objects.get(id=feature)

	tags = Tag.objects.all()

	return render(request, 'map/add_image.html', {'feature': feature, 'form': form, 'image': image, 'tags': tags })



@login_required
def moderate_media(request, media):
	"""View to allow administrators to moderate media"""
	if request.user.is_staff == False:
		raise Http404('Media does not exist')

	media = get_object_or_404(Media, id=media)

	if request.method == 'POST':
		"""Save the form if the request is a POST"""
		form = AdminMediaForm(request.POST, instance=media)
		m = form.save(commit=False)

		if form.is_valid():
			published = request.POST.get('publish')

			if published != None:
				"""If the published checkbox isn't ticked (which it won't be an unless an editor's seen and checked it, put the document in pending."""
				if published == 'Approve':
					m.pending = False
				else:
					m.pending = True

			m.save()
			form.save_m2m()

			if published == 'Approve':
				"""If the 'published' box is checked, email the contributor to say thanks, otherwise just return the editor to the dashboard"""
				editor = request.user
				message = request.POST.get('email_thanks')
				inform_user_of_content_publication(m.author, m.title, editor, message)
				return dashboard(request)
			else:
				return dashboard(request)

	else:
		"""Display the form with its content if request is a GET"""
		form = AdminMediaForm(instance=media)

	return render(request, 'map/moderate_media.html', {'form': form, 'media': media })



@login_required
def edit_media(request, feature, media=None):
	"""View to enable users to upload or edit media (or rather, media embeds)"""
	if media:
		media = Media.objects.get(id=media)
		if request.user != media.author:
			raise Http404("Media does not exist")
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
			form.save_m2m()

			if m.pending != True:
				return user_overview(request, request.user.username)
			else:
				inform_managers_of_content_submission(request)
				return ugc_thanks(request, feature.id)

		else:
			feature = Feature.objects.get(id=feature)

	else:
		if media == None:
			form = MediaForm()
		else:
			form = MediaForm(initial={'title': 'Add a title (required)', 'url': 'Add a link to a media file (required)'}, instance=document)
		feature = Feature.objects.get(id=feature)

	tags = Tag.objects.all()

	return render(request, 'map/add_media.html', {'feature': feature, 'form': form, 'media': media, 'tags': tags })


# API Views

class JSONResponse(HttpResponse):
    """An HttpResponse that its content into JSON."""
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

@cache_page(60 * 30)
def features(request):
	"""All Features as geoJson"""
	if request.method == 'GET':
		features =  Feature.objects.all()
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def single_feature(request, feature):
	"""Get a single feature"""
	if request.method== 'GET':
		feature = Feature.objects.get(id=feature)
		serializer = FeatureSerializer(feature, many=False)
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
		"""Gather all features by a particular tag, ensuring that you include tags attached to media, images, and documents"""
		features = Feature.objects.filter(Q(tags__name__in=[tag]) | Q(document__tags__name__in=[tag]) | Q(image__tags__name__in=[tag]) | Q(media__tags__name__in=[tag]))
		serializer = FeatureSerializer(features, many=True)
		return JSONResponse(serializer.data)

def features_by_author(request, author):
	if request.method == 'GET':
		documents = Feature.objects.filter(document__author=author).filter(published=True)
		images = Feature.objects.filter(image__author=author).filter(published=True)
		media = Feature.objects.filter(media__author=author).filter(published=True)
		features = list(chain(documents, images, media))
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
