from django.contrib import admin
from map.models import Feature, Document, Category, DocumentType, UserProfile, Image, Media
from djgeojson.fields import GeoJSONField
from leaflet.admin import LeafletGeoAdmin
from map.forms import FeatureForm
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User

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
		('Dates', {
			'fields': ('original', 'rebuild_1', 'rebuild_2', 'f_date'),
			'classes': ('wide',),
		}),
		('Building Information', {
			'fields': ('storeys', 'basement', 'architect', 'builders', 'materials', 'type', 'c_area', 'listed',),
			'classes': ('wide',),
		}),
		('Other Metadata', {
			'fields': ('categories', 'thumbnail', 'tags', 'banner',),
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

class UserProfileInline(admin.StackedInline):
	model = UserProfile
	can_delete = False
	verbose_name_plural = 'Profile'

class UserAdmin(BaseUserAdmin):
	inlines = (UserProfileInline, )

admin.site.register(Category)
admin.site.register(Feature, FeatureAdmin)
admin.site.register(Document)
admin.site.register(DocumentType)
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Image)
admin.site.register(Media)


