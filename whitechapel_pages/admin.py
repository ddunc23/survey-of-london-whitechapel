from django.contrib import admin
from whitechapel_pages.models import Page, QuickContribution

# Register your models here.

class PageAdmin(admin.ModelAdmin):
	filter_horizontal = ['documents',]
	prepopulated_fields = {"slug": ("title",)}
	raw_id_fields=('building_of_the_week',)
	autocomplete_lookup_fields = {
		'fk': ['building_of_the_week',],
	}

admin.site.register(Page, PageAdmin)
admin.site.register(QuickContribution)