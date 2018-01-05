from django.shortcuts import render, get_object_or_404
from django.http import  HttpResponseRedirect
from django.core.urlresolvers import reverse
from map.models import Feature, Document, Category, Image, Media
from map.utils import get_similar_features
from whitechapel_blog.models import Post
from whitechapel_blog.models import Category as BlogCategory
from whitechapel_pages.models import Page
from itertools import chain
from operator import attrgetter
import datetime
from django.contrib.sitemaps import Sitemap
from forms import QuickContributionForm
from django.core.mail import send_mail
from django.db.models import Q



def inform_managers_of_quick_contribution(form_data):
	"""Tell the SoL admins that a new quick contribution has been submitted"""
	admin_message = 'Hello Survey of London Editors.\nSomeone\'s gone and made a quick contribution!\nName: %s\nEmail: %s\nContribution: %s\nLocation: %s' % (form_data['name'], form_data['email'], form_data['text'], form_data['location'])
	admin_html_message = '<p>Hello Survey fo London Editors.</p><p>Someone\'s gone and made a quick contribution!</p><p><strong>Name:</strong> %s</p><p><strong>Email:</strong> %s</p><p><strong>Contribution:</strong> %s</p><p><strong>Location:</strong> %s</p>' % (form_data['name'], form_data['email'], form_data['text'], form_data['location'])
	contributor_message = 'Hello %s.\n Your contribution to the Survey of London: Histories of Whitechapel has been received. An editor will contact you when your submission has been published.\n Thank you for your submission.\nThe Survey of London Editors' % (form_data['name'])
	contributor_html_message = '<p>Hello %s.</p><p>Your contribution has been received by the Survey of London editors has been received. An editor will contact you when your submission has been published.</p><p>Thank you for your submission.<br />The Survey of London Editors.</p>' % (form_data['name'])

	send_mail('New Quick Contribution', message=admin_message, html_message=admin_html_message, from_email='admin@surveyoflondon.org', recipient_list=['solwhitechapel.bartlett@ucl.ac.uk'])
	# send_mail('Thank You For Your Contribution', message=contributor_message, html_message=contributor_html_message, from_email='admin@surveyoflondon.org', recipient_list=[form_data['email']])



def site_home(request):
	"""The front page of the website"""
	page = Page.objects.get(is_front_page=True)
	categories = Category.objects.all().order_by('name')
	images = Image.objects.filter(published=True, author__is_staff=False).exclude(created=None).order_by('-created')[:5]
	documents = Document.objects.filter(published=True, author__is_staff=False).exclude(created=None).order_by('-created')[:5]
	media = Media.objects.filter(published=True, author__is_staff=False).exclude(created=None).order_by('-created')[:5]
	posts = Post.objects.filter(date_published__lte=datetime.date.today()).exclude(categories__slug__iexact='events')[:3]

	# A random selection of images by the professional photographers
	lost_properties = Image.objects.filter(Q(published=True) & Q(author__id=27) | Q(author__id=26) | Q(author__id=31) | Q(author__id=49)).exclude(feature__feature_type="GREATER_WHITECHAPEL", feature__count__lte=7).order_by("?")[:5]

	latest = list(chain(documents, images))
	latest.sort(key=attrgetter('created'), reverse=True)

	latest = latest[:3]

	for item in latest:
		tags = item.tags.names()
		item.weighted_tags = []
		for tag in tags:
			count = Document.objects.filter(tags__name__in=[tag]).count() + Image.objects.filter(tags__name__in=[tag]).count() + Media.objects.filter(tags__name__in=[tag]).count()
			item.weighted_tags.append({'name': tag, 'count': count})

	# Quick contribution form
	if request.method == 'POST':
		form = QuickContributionForm(request.POST)
		if form.is_valid():
			form_data = form.cleaned_data
			f = form.save()
			inform_managers_of_quick_contribution(form_data)
			
			return HttpResponseRedirect(reverse('quick_contribution_acknowledgement'))
	
	else:
		form = QuickContributionForm()

	page.featured_similar = get_similar_features(page.building_of_the_week)[:3]

	header_images = [page.banner_image_1, page.banner_image_2, page.banner_image_3, page.banner_image_4]

	return render(request, 'whitechapel_pages/index.html', {'page': page, 'title': 'Survey of London', 'subhead': 'Whitechapel', 'categories': categories, 'images': images, 'documents': documents, 'media': media, 'latest': latest, 'posts': posts, 'form': form, 'lost_properties': lost_properties, 'header_images': header_images })


def page(request, page_slug):
	"""Any other page"""
	page = Page.objects.get(slug=page_slug)

	return render(request, 'whitechapel_pages/page.html', {'page': page})


def quick_contribution_acknowledgement(request):
	"""
	Passes the user to a thanks page to let them know their contribution hasn't gone into the ether
	"""
	return render(request, 'whitechapel_pages/ugc_thanks.html')


def listing(request):
	"""
	A view containing an automatically-generated list of upcoming events taken from the blog
	"""
	# The below is hard-coded and nasty and should be refactored
	event_category = BlogCategory.objects.get(id=1)
	events = Post.objects.filter(categories=event_category)
	today = datetime.date.today()
	past_events = events.filter(past_event=True).order_by('-event_date_start')
	upcoming_events = events.filter(event_date_start__gte=today).order_by('event_date_start')
	return render(request, 'whitechapel_pages/listing.html', {'past_events': past_events, 'upcoming_events': upcoming_events})


# Sitemap

class PageSitemap(Sitemap):
	priority = 0.6
	protocol = 'https'

	def items(self):
		return Page.objects.all().exclude(is_front_page=True)

class FrontPageSitemap(Sitemap):
	priority = 1
	protocol = 'https'
	location = '/'

	def items(self):
		return Page.objects.filter(is_front_page=True)
