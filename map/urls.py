from django.conf.urls import include, url
import views

urlpatterns = [
    # Map
    url(r'^$', views.map_home, name='map_home'),
    url(r'feature/(?P<feature>\d+)/$', views.feature, name='feature'),
    url(r'feature/(?P<feature>\d+)/detail/$', views.detail, name='detail'),
    url(r'feature/(?P<feature>\d+)/legend/$', views.feature_legend, name='feature_legend'),
    url(r'^category/(?P<category>\w+)/$', views.category, name='category'),
    url(r'^features/tagged/(?P<tag>.+)/$', views.tag, name='tag'),
    url(r'features/date/(?P<build_date>\d+)/$', views.date_range, name='date_range'),
    url(r'^features/search/$', views.search_map, name='search_map'),
    url(r'^user/(?P<user>\w+)/content/$', views.all_content_by_author, name='all_content_by_author'),
    # API
    url(r'^api/features/$', views.features, name='features'),
    url(r'^api/features/(?P<feature>\d+)/$', views.single_feature, name='single_feature'),
    url(r'^api/features/date/(?P<build_date>\d+)/$', views.features_by_build_date, name='features_by_date'),
    url(r'^api/features/date/(?P<start_date>\d+)/(?P<end_date>\d+)/$', views.features_by_date_range, name='features_by_date_range'),
    url(r'^api/features/street/(?P<street>.+)/$', views.features_by_street_name, name='features_by_street_name'),
    url(r'^api/features/category/(?P<category>\d+)/$', views.features_by_category, name='features_by_category'),
    url(r'^api/features/tagged/(?P<tag>.+)/$', views.features_by_tag, name='features_by_tag'),
    url(r'^api/features/search/$', views.search_features, name='search_features'),
    url(r'^api/features/author/(?P<author>\d+)/$', views.features_by_author, name='features_by_author'),
    # User Generated Content
    url(r'^feature/(?P<feature>\d+)/content/add/$', views.ugc_choice, name='ugc_choice'),
    url(r'^feature/(?P<feature>\d+)/document/add/$', views.edit_document, name='add_document'),
    url(r'^feature/(?P<feature>\d+)/document/(?P<document>\d+)/edit/$', views.edit_document, name='edit_document'),
    url(r'^feature/(?P<feature>\d+)/image/add/$', views.edit_image, name='add_image'),
    url(r'^feature/(?P<feature>\d+)/image/(?P<image>\d+)/edit/$', views.edit_image, name='edit_image'),
    url(r'^feature/(?P<feature>\d+)/media/add/$', views.edit_media, name='add_media'),
    url(r'^feature/(?P<feature>\d+)/media/(?P<media>\d+)/edit/$', views.edit_media, name='edit_media'),
    url(r'^feature/(?P<feature>\d+)/content/add/thanks/$', views.ugc_thanks, name='ugc_thanks'),
    # User Content Management
    url(r'^user/overview/$', views.user_overview, name='user_overview'),
]