from allauth.socialaccount.adapter import DefaultSocialAccountAdapter
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect

class SocialAccountAdapter(DefaultSocialAccountAdapter):
    def get_login_redirect_url(self, request):
        # do your logic here for different social accounts
        if hasattr(request.user, 'date_joined') == False:
        	return HttpResponseRedirect(reverse('user_profile'))
        else:
        	return HttpResponseRedirect(reverse('map_home'))