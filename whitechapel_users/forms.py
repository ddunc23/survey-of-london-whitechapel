from django import forms
from allauth.account.forms import LoginForm
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django.contrib.auth.models import User
from whitechapel_users.models import UserProfile
from django.forms.models import inlineformset_factory

class WhitechapelLoginForm(LoginForm):
	def __init__(self, *args, **kwargs):
		super(WhitechapelLoginForm, self).__init__(*args, **kwargs)
		self.fields['login'].widget = forms.TextInput(attrs={'type': 'email', 'class': 'form-control'})
		self.fields['password'].widget = forms.PasswordInput(attrs={'class': 'form-control'})

class WhitechapelUserProfileForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ['username', 'email']

WhitechapelUserProfileFormExtra = inlineformset_factory(User, UserProfile, can_delete=False, fields=['display_name'])