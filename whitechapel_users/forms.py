from django import forms
from allauth.account.forms import LoginForm
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

class WhitechapelLoginForm(LoginForm):
	def __init__(self, *args, **kwargs):
		super(WhitechapelLoginForm, self).__init__(*args, **kwargs)
		self.fields['login'].widget = forms.TextInput(attrs={'type': 'email', 'class': 'form-control'})
		self.fields['password'].widget = forms.PasswordInput(attrs={'class': 'form-control'})