from django.conf.urls import include, url
from django.urls import path

# Whitechapel
from .views import *

from .distill_funcs import get_all_features, get_index, get_all_tags, get_all_categories, get_all_dates, get_all_sites, get_all_users, get_all_streets, get_all_authors

# Other python modules
from django_distill import distill_path

urlpatterns = [
    # Map
    distill_path('', map_home, name='map_home', distill_func=get_index),
    distill_path('feature/<int:feature>/', feature, name='feature', distill_func=get_all_features),
    distill_path('feature/<int:feature>/detail/', detail, name='detail', distill_func=get_all_features),
    distill_path('feature/<int:feature>/legend/', feature_legend, name='feature_legend', distill_func=get_all_features),
    distill_path('category/<int:category>/', category, name='category', distill_func=get_all_categories),
    distill_path('features/tagged/<tag>/', tag, name='tag', distill_func=get_all_tags),
    distill_path('features/date/<int:build_date>/', date_range, name='date_range', distill_func=get_all_dates),
    url(r'^features/search/$', search_map, name='search_map'),
    distill_path('user/<int:user>/content/', all_content_by_author, name='all_content_by_author', distill_func=get_all_users),
    distill_path('site/<int:site>/', site, name='site', distill_func=get_all_sites),
    # API
    distill_path('api/features/', features, name='features', distill_func=get_index),
    distill_path('api/features/<int:feature>/', single_feature, name='single_feature', distill_func=get_all_features),
    path('api/features/date/<int:build_date>/', features_by_build_date, name='features_by_date'),
    url(r'^api/features/date/(?P<start_date>\d+)/(?P<end_date>\d+)/$', features_by_date_range, name='features_by_date_range'),
    path('api/features/street/<street>/', features_by_street_name, name='features_by_street_name', ),
    distill_path('api/features/category/<int:category>/', features_by_category, name='features_by_category', distill_func=get_all_categories),
    distill_path('api/features/tagged/<tag>/', features_by_tag, name='features_by_tag', distill_func=get_all_tags),
    url(r'^api/features/search/$', search_features, name='search_features'),
    distill_path('api/features/author/<int:author>/', features_by_author, name='features_by_author', distill_func=get_all_authors),
    distill_path('api/features/site/<site>/', features_by_site, name='features_by_site', distill_func=get_all_sites),
    # User Generated Content
    url(r'^feature/(?P<feature>\d+)/content/add/$', ugc_choice, name='ugc_choice'),
    url(r'^feature/(?P<feature>\d+)/document/add/$', edit_document, name='add_document'),
    url(r'^feature/(?P<feature>\d+)/document/(?P<document>\d+)/edit/$', edit_document, name='edit_document'),
    url(r'^feature/(?P<feature>\d+)/image/add/$', edit_image, name='add_image'),
    url(r'^feature/(?P<feature>\d+)/image/(?P<image>\d+)/edit/$', edit_image, name='edit_image'),
    url(r'^feature/(?P<feature>\d+)/media/add/$', edit_media, name='add_media'),
    url(r'^feature/(?P<feature>\d+)/media/(?P<media>\d+)/edit/$', edit_media, name='edit_media'),
    url(r'^feature/(?P<feature>\d+)/content/add/thanks/$', ugc_thanks, name='ugc_thanks'),
    # User Content Management
    url(r'^user/overview/$', user_overview, name='user_overview'),
    url(r'^dashboard/$', dashboard, name='dashboard'),
    url(r'^document/(?P<document>\d+)/moderate/$', moderate_document, name='moderate_document'),
    url(r'^image/(?P<image>\d+)/moderate/$', moderate_image, name='moderate_image'),
    url(r'^media/(?P<media>\d+)/moderate/$', moderate_media, name='moderate_media'),
    # Tag Autocomplete
    url(r'^tag-autocomplete/$', TagAutocomplete.as_view(), name='tag-autocomplete'),
]