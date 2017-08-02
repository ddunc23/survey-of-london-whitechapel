# Django core
from django import forms

# Whitechapel
from whitechapel_pages.models import QuickContribution

class QuickContributionForm(forms.ModelForm):
	"""
	A form which allows users to contribute their information without having to sign up. Content is emailed to the editors
	"""
	class Meta:
		model = QuickContribution
		fields = ('name', 'email', 'location', 'text',)
		labels = {
			'name': '',
			'email': '',
			'text': '',
			'location': ''
		}
		widgets = {
			'name': forms.TextInput(attrs={'placeholder': 'Your Name'}),
			'email': forms.EmailInput(attrs={'placeholder': 'Your Email Address'}),
			'location': forms.TextInput(attrs={'placeholder': 'Where in Whitechapel is your contribution about?'}),
			'text': forms.Textarea(attrs={'placeholder': 'Your Contribution', 'rows': 7}),
		}

