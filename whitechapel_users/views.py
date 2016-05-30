from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from whitechapel_users.forms import WhitechapelUserProfileForm, WhitechapelUserProfileFormExtra
from django.contrib.auth.models import User
from whitechapel_users.models import UserProfile
from map.views import user_overview
from allauth.account.views import login

# Create your views here.

def home(request, user):
	pass

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
				return user_overview(request, user)
		else:
			print form.errors
			form = WhitechapelUserProfileForm(instance=user)
			profile_extra = WhitechapelUserProfileFormExtra(instance=user)
	else:
		form = WhitechapelUserProfileForm(instance=user)
		profile_extra = WhitechapelUserProfileFormExtra(instance=user)

	return render(request, 'whitechapel_users/profile.html', {'form': form, 'profile_extra': profile_extra})
