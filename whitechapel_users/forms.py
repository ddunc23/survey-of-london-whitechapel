from django import forms
from allauth.account.forms import LoginForm, SignupForm
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

class WhitechapelSignupForm(SignupForm):
	def __init__(self, *args, **kwargs):
		super(WhitechapelSignupForm, self).__init__(*args, **kwargs)
		self.fields['username'].help_text = 'By default, your contributions will appear under your username. You can change this once you\'ve made an account. It\'s best not to use your email address as a username.'
		self.fields['email'].help_text = 'We won\'t share your email address with anyone. You can opt out of email communications with the Survey of London at any time.'

class WhitechapelUserProfileForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ['username', 'email']

WhitechapelUserProfileFormExtra = inlineformset_factory(User, UserProfile, can_delete=False, fields=['emails', 'newsletter', 'display_name', 'bio'], help_texts={'display_name': 'Your contributions will be attributed to you by your user name. If you\'d like to change this, enter a display name here.', 'bio': 'If you\'d like to tell us a little bit about yourself you can do so here. This information will be visible to other users if they look at your contributions.', 'emails': 'When you submit content and it\'s been approved by the Survey of London editors, you\'ll be notified by email. If you\'d rather not receive these emails, uncheck this box. Your email address isn\'t visible on the website, and we won\'t share it with anyone.', 'newsletter': 'Tick this box if you\'d like to subscribe to our mailing list for regular updates about the project.'})