from django.contrib import admin
from whitechapel_pages.models import Page

# Register your models here.

class PageAdmin(admin.ModelAdmin):
	filter_horizontal = ['features', 'documents']
	prepopulated_fields = {"slug": ("title",)}

admin.site.register(Page, PageAdmin)