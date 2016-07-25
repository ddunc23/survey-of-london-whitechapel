from django import forms
from map.models import Feature, Document, Image, Media
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit

class FeatureForm(forms.ModelForm):
	class Meta:
		model = Feature
		fields = ('geom', 'b_number', 'b_name', 'street', 'postcode', 'address', 'b_type', 'current', 'previous_1', 'previous_2', 'previous_3', 'extension_1', 'extension_2', 'extension_3', 'f_date', 'storeys', 'basement', 'architect', 'builders', 'materials', 'short_description', 'c_area', 'listed', 'count', 'categories', 'thumbnail', 'tags', 'site')
		widgets = {
			'basement': forms.Select(),
			'c_area': forms.Select(),
			'listed':  forms.Select(),
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


class AdminDocumentForm(DocumentForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here.', required=False, widget=forms.Textarea, initial='Hello.\nYour submission has been published on the Survey of London Whitechapel Website.\nThanks for your contribution.')
	class Meta(DocumentForm.Meta):
		fields = ('title', 'tags', 'body', 'email_thanks', 'document_type', 'order', 'published', 'aggregate')
		labels = {
			'title': 'Edit the title',
			'tags': 'Add more tags as necessary',
			'body': 'Text',
			'published': 'Tick this box to approve this submission and publish it on the map.',
			'document_type': 'Choose a category for this submission.',
			'order': 'Order',
			'aggregate': 'Tick this box to attach this content to all the buildings on this site.'
		}
		help_texts = {
			'order': 'What priority should this have on the building page? 0 is highest, higher numbers determine what order each piece of content appears.'
		}


class ImageForm(forms.ModelForm):
	class Meta:
		model = Image
		fields = ('title', 'file', 'tags')
		labels = {
			'title': 'Give your contribution a title',
			'file': 'Upload Image',
			'tags': 'Add one or two tags so people can find your image more easily',
		}
		widgets = {
			'file': forms.ClearableFileInput(attrs={'class':'img-upload'}),
			#'tags': forms.SelectMultiple(),
		}
		help_texts = {
			'tags': '',
		}


class AdminImageForm(ImageForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here.', required=False, widget=forms.Textarea)
	class Meta(ImageForm.Meta):
		fields = ('title', 'tags', 'email_thanks', 'published', 'aggregate')
		labels = {
			'title': 'Edit the title',
			'tags': 'Add more tags as necessary',
			'published': 'Tick this box to approve this submission and publish it on the map.',
			'aggregate': 'Tick this box to attach this content to all the buildings on this site.',
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

class AdminMediaForm(MediaForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here.', required=False, widget=forms.Textarea)
	class Meta(MediaForm.Meta):
		fields = ('title', 'tags', 'url', 'email_thanks', 'published', 'aggregate')
		labels = {
			'title': 'Edit the title',
			'tags': 'Add more tags as necessary',
			'url': 'Check to see if the URL is correct',
			'published': 'Tick this box to approve this submission and publish it on the map.',
			'aggregate': 'Tick this box to attach this content to all the buildings on this site.',
		}