from django.contrib import admin
from whitechapel_blog.models import Post, Category



class PostAdmin(admin.ModelAdmin):
	prepopulated_fields = {'slug': ('title',)}
	list_display = ('title', 'author', 'date_published', 'category', 'past_event')
	fieldsets = (
		('Post', {
			'fields': ('title', 'slug', 'author', 'post_preview', 'post_thumbnail', 'body', 'date_published', 'categories')
		}),
		('Event Settings', {
			'fields': ('event_date_start', 'event_date_end', 'event_time', 'past_event')
		}),
	)

	def category(self, obj):
		categories = ''
		for category in obj.categories.all():
			categories = categories + str(category) + ' '
		return categories

	def set_past_event_action(self, request, queryset):
		"""
		Action that marks the selected post as a 'past event' that will then show up on the events listing page
		"""
		queryset.update(past_event=True)

	set_past_event_action.short_description = 'Mark selected posts as \'past events\''

	actions = [set_past_event_action]


class CategoryAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug": ("title",)}

admin.site.register(Post, PostAdmin)
admin.site.register(Category, CategoryAdmin)