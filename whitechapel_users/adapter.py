from allauth.socialaccount.adapter import DefaultSocialAccountAdapter
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from datetime import datetime

class SocialAccountAdapter(DefaultSocialAccountAdapter):
    def get_connect_redirect_url(self, request):
        threshold = 90
        if (request.user.last_login - request.user.date_joined).seconds < threshold:
        	return HttpResponseRedirect(reverse('user_profile'))
        else:
        	return HttpResponseRedirect(reverse('map_home'))