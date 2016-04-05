from django.contrib import admin
from map.models import Feature, Document, Category, Story, Document, DocumentType
from djgeojson.fields import GeoJSONField
from leaflet.admin import LeafletGeoAdmin
from map.forms import FeatureForm

# Register your models here.

class DocumentInline(admin.StackedInline):
	model = Document
	extra = 0

class StoryInline(admin.StackedInline):
	model = Story
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
		StoryInline
	]
	search_fields = ['address','b_name']
	settings_overrides = {
		'DEFAULT_ZOOM': 5
	}

admin.site.register(Story)
admin.site.register(Category)
admin.site.register(Feature, FeatureAdmin)
admin.site.register(Document)
admin.site.register(DocumentType)


