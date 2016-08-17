from django.contrib import admin
from map.models import Feature, Document, Category, Image, Media, Site
from whitechapel_users.models import UserProfile
from djgeojson.fields import GeoJSONField
from leaflet.admin import LeafletGeoAdmin
from map.forms import FeatureForm, AddDescriptionActionForm, AddThumbnailActionForm, AddAddressActionForm
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from django.shortcuts import render
from django.contrib import messages

# Register your models here.

class DocumentInline(admin.StackedInline):
	model = Document
	extra = 0

class ImageInline(admin.StackedInline):
	model = Image
	extra = 0

class MediaInline(admin.StackedInline):
	model = Media
	extra = 0

class FeatureAdmin(LeafletGeoAdmin):
	form = FeatureForm
	fieldsets = (
		('Footprint', {
			'fields': ('id', 'geom',),
		}),
		('Address', {
			'fields': ('b_number', 'b_name', 'street', 'postcode', 'address'),
			'classes': ('wide',),
		}),
		('Short Description', {
			'fields': ('short_description',),
			'classes': ('wide',),
		}),
		('Dates', {
			'fields': ('current', 'previous_1', 'previous_2', 'previous_3', 'extension_1', 'extension_2', 'extension_3', 'f_date'),
			'classes': ('wide',),
		}),
		('Building Information', {
			'fields': ('storeys', 'basement', 'architect', 'builders', 'materials', 'c_area', 'listed', 'b_type'),
			'classes': ('wide',),
		}),
		('Catgeories, Site, Tags, and Thumbnail Image', {
			'fields': ('categories', 'thumbnail', 'thumbnail_position', 'tags', 'site'),
			'classes': ('wide',),
		}),
	)
	filter_horizontal = ['categories']
	inlines = [
		DocumentInline,
		ImageInline,
		MediaInline,
	]
	search_fields = ['address','b_name']
	settings_overrides = {
		'DEFAULT_ZOOM': 5
	}
	list_display = ('id', 'b_name', 'address', 'postcode', 'short_description', 'thumbnail')
	list_editable = ('short_description', 'address')
	actions = ['set_description_action', 'add_thumbnail_action', 'set_address_action']

	def set_description_action(self, request, queryset):
		if 'do_action' in request.POST:
			form = AddDescriptionActionForm(request.POST)
			if form.is_valid():
				short_description = form.cleaned_data['short_description']
				for feature in queryset:
					feature.short_description = short_description
					feature.save()
				updated = len(queryset)
				messages.success(request, '{0} features were updated'.format(updated))
				return
		else:
			form = AddDescriptionActionForm()

		return render(request, 'admin/map/action_short_description.html', {'title': 'Add a Description', 'objects': queryset, 'form': form})

	set_description_action.short_description = 'Add a short description to selected Buildings'

	def add_thumbnail_action(self, request, queryset):
		if 'do_action' in request.POST:
			form = AddThumbnailActionForm(request.POST, request.FILES)
			if form.is_valid():
				thumbnail = request.FILES['file']
				for feature in queryset:
					feature.thumbnail = thumbnail
					feature.save()
				updated = len(queryset)
				messages.success(request, '{0} features were updated'.format(updated))
				return
		else:
			form = AddThumbnailActionForm()

		return render(request, 'admin/map/action_add_thumbnail.html', {'title': 'Add a Thumbnail', 'objects': queryset, 'form': form})

	add_thumbnail_action.short_description = 'Add a thumbnail to selected Buildings'

	def set_address_action(self, request, queryset):
		if 'do_action' in request.POST:
			form = AddAddressActionForm(request.POST)
			if form.is_valid():
				address = form.cleaned_data['address']
				for feature in queryset:
					feature.address = address
					feature.save()
				updated = len(queryset)
				messages.success(request, '{0} features were updated'.format(updated))
				return
		else:
			form = AddAddressActionForm()

		return render(request, 'admin/map/action_address.html', {'title': 'Update Address', 'objects': queryset, 'form': form})

	set_address_action.short_description = 'Update the addresses of selected Buildings'




class UserProfileInline(admin.StackedInline):
	model = UserProfile
	can_delete = False
	verbose_name_plural = 'Profile'

class UserAdmin(BaseUserAdmin):
	inlines = (UserProfileInline, )

admin.site.register(Category)
admin.site.register(Site)
admin.site.register(Feature, FeatureAdmin)
admin.site.register(Document)
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Image)
admin.site.register(Media)

