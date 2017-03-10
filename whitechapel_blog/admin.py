from django.contrib import admin
from whitechapel_blog.models import Post, Category

class PostAdmin(admin.ModelAdmin):
	prepopulated_fields = {'slug': ('title',)}
	# exclude = ('author',)
	list_display = ('title', 'author', 'date_published')

class CategoryAdmin(admin.ModelAdmin):
	prepopulated_fields = {"slug": ("title",)}

admin.site.register(Post, PostAdmin)
admin.site.register(Category, CategoryAdmin)