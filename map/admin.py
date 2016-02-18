from django.contrib import admin
from .models import Feature, OS_Feature, Document
from djgeojson.fields import GeoJSONField
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

class DocumentInline(admin.StackedInline):
	model = Document
	extra = 0

class FeatureAdmin(LeafletGeoAdmin):
	inlines = [
		DocumentInline,
	]
	search_fields = ['address']
	settings_overrides = {
		'DEFAULT_ZOOM': 5
	}

admin.site.register(OS_Feature, FeatureAdmin)


