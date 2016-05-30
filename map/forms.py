from django import forms
from map.models import Feature, Document, Image, Media
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

class FeatureForm(forms.ModelForm):
	class Meta:
		model = Feature
		fields = ('geom', 'b_number', 'b_name', 'street', 'postcode', 'address', 'b_type', 'original', 'rebuild_1', 'rebuild_2', 'f_date', 'storeys', 'basement', 'architect', 'builders', 'materials', 'short_description', 'c_area', 'listed', 'count', 'categories', 'thumbnail', 'tags',)
		widgets = {
			'basement': forms.CheckboxInput(),
			'c_area': forms.CheckboxInput(),
			'listed':  forms.CheckboxInput(),
		}

class DocumentForm(forms.ModelForm):
	class Meta:
		model = Document
		fields = ('title', 'tags', 'body',)
		labels = {
			'title': 'Give your contribution a title',
			'tags': 'Add one or two tags so people can find your contribution more easily',
			'body': 'Text',
		}
		widgets = {
			# 'body': forms.TextInput(attrs={'class': 'medium-editor-input'})
		}
		help_texts = {
			'tags': '',
		}

class ImageForm(forms.ModelForm):
	class Meta:
		model = Image
		fields = ('title', 'file', 'tags')
		labels = {
			'title': 'Give your contribution a title',
			'file': 'Upload Image',
			'tags': 'Add one or two tags so people can find your image more easily'
		}
		widgets = {
			'file': forms.ClearableFileInput(attrs={'class':'img-upload'}),
			#'tags': forms.SelectMultiple(),
		}
		help_texts = {
			'tags': '',
		}

class MediaForm(forms.ModelForm):
	class Meta:
		model = Media
		fields = ('title', 'url', 'tags')
		labels = {
			'title': 'Give your contribution a title',
			'url': 'Paste a link to YouTube, Vimeo or SoundCloud media here',
			'tags': 'Add one or two tags so people can find your contribution more easily'
		}
		widgets = {
			#'tags': forms.SelectMultiple()
		}
		help_texts = {
			'tags': '',
		}