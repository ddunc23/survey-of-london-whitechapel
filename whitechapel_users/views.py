from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from whitechapel_users.forms import WhitechapelUserProfileForm, WhitechapelUserProfileFormExtra
from django.contrib.auth.models import User
from whitechapel_users.models import UserProfile
from map.views import user_overview, map_home
from allauth.account.views import login
from allauth.account.signals import user_signed_up
from django.dispatch import receiver
from django.core.mail import mail_managers, send_mail
from django.core.mail.message import EmailMessage

@login_required
def user_profile(request):
	"""View to allow users to edit their profile"""
	user = User.objects.get(id=request.user.id)
	if request.method == 'POST':
		form = WhitechapelUserProfileForm(request.POST, instance=user)
		if form.is_valid():
			profile = form.save(commit=False)
			profile_extra = WhitechapelUserProfileFormExtra(request.POST, instance=profile)
			if profile_extra.is_valid():
				profile.save()
				profile_extra.save()
				return HttpResponseRedirect(reverse('map_home'))
		else:
			form = WhitechapelUserProfileForm(instance=user)
			profile_extra = WhitechapelUserProfileFormExtra(instance=user)
	else:
		form = WhitechapelUserProfileForm(instance=user)
		profile_extra = WhitechapelUserProfileFormExtra(instance=user)

	return render(request, 'whitechapel_users/profile.html', {'form': form, 'profile_extra': profile_extra})

@login_required
def check_first_login(request):
	"""Check if a user has logged in before. If they have, punt them to the map, if they haven't, give them an opportunity to check the default settings on their account."""
	threshold = 90
	if (request.user.last_login - request.user.date_joined).seconds < threshold:
		return HttpResponseRedirect(reverse('user_profile'))
	else:
		return HttpResponseRedirect(reverse('map_home'))