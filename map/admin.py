from django.contrib import admin
from .models import OS_Feature, Document, Neighbourhood, Category, Story
from djgeojson.fields import GeoJSONField
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

class DocumentInline(admin.StackedInline):
	model = Document
	extra = 0

class StoryInline(admin.StackedInline):
	model = Story
	extra = 0

class FeatureAdmin(LeafletGeoAdmin):
	inlines = [
		DocumentInline,
		StoryInline
	]
	search_fields = ['address']
	settings_overrides = {
		'DEFAULT_ZOOM': 5
	}

admin.site.register(Story)
admin.site.register(Neighbourhood)
admin.site.register(Category)
admin.site.register(OS_Feature, FeatureAdmin)


