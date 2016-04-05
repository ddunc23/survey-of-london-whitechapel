from django.contrib import admin
from whitechapel_pages.models import Page

# Register your models here.

class PageAdmin(admin.ModelAdmin):
	filter_horizontal = ['features', 'documents']

admin.site.register(Page, PageAdmin)