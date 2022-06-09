from .models import Feature, Category, Site
from taggit.models import Tag
from django.contrib.auth.models import User

def get_index():
	return None

def get_all_features():
	for feature in Feature.objects.all():
		yield {'feature': feature.id}

def get_all_categories():
	for category in Category.objects.all():
		yield {'category': category.id}

def get_all_tags():
	for tag in Tag.objects.all():
		if tag.slug != '':
			yield {'tag': tag.slug}

def get_all_dates():
	for feature in Feature.objects.all():
		if feature.f_date:
			yield {'build_date': feature.f_date}

def get_all_sites():
	for site in Site.objects.all():
		yield {'site': site.id}

def get_all_users():
	for user in User.objects.all():
		yield {'user': user.id}

def get_all_authors():
	for user in User.objects.all():
		yield {'author': user.id}

def get_all_streets():
	streets = []
	for feature in Feature.objects.all():
		if feature.street not in streets:
			if '/' not in feature.street:
				streets.append(feature.street)
				yield {'street': feature.street}