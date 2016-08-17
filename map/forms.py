from django import forms
from map.models import Feature, Document, Image, Media
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from dal import autocomplete

class FeatureForm(forms.ModelForm):
	class Meta:
		model = Feature
		fields = ('geom', 'b_number', 'b_name', 'street', 'postcode', 'address', 'b_type', 'current', 'previous_1', 'previous_2', 'previous_3', 'extension_1', 'extension_2', 'extension_3', 'f_date', 'storeys', 'basement', 'architect', 'builders', 'materials', 'short_description', 'c_area', 'listed', 'count', 'categories', 'thumbnail', 'thumbnail_position', 'tags', 'site')
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
			'tags': autocomplete.TaggitSelect2(url='tag-autocomplete')
		}
		help_texts = {
			'tags': 'Tags help people find your content. For example, if you\'ve got a memory of a particular time, you could tag it \'1960s\'.',
		}

class AdminDocumentForm(DocumentForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here. If a contributor has opted out of email updates they won\'t receive this.', required=False, widget=forms.Textarea, initial='Hello.\nYour submission has been published on the Survey of London Whitechapel Website.\nThanks for your contribution.\n\n\nIf you\'d like to stop receiving these emails, log in to your account and uncheck the "Receive emails about your submissions from the Survey of London?" on your profile page.')
	send_email = forms.BooleanField(label='Send Email?', help_text='If you don\'t want to notify a contributor by email that their contribution has been approved, uncheck this box.', initial=True, required=False)
	class Meta(DocumentForm.Meta):
		fields = ('title', 'tags', 'body', 'email_thanks', 'send_email', 'document_type', 'order', 'published', 'aggregate')
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
			'order': 'What priority should this have on the building page? 0 is highest, higher numbers determine what order each piece of content appears.',
			'tags': '',
		}


class ImageForm(forms.ModelForm):
	class Meta:
		model = Image
		fields = ('title', 'file', 'tags', 'description')
		labels = {
			'title': 'Give your contribution a title',
			'file': 'Upload Image',
			'tags': 'Add one or two tags so people can find your image more easily',
			'description': 'Tell us a little about this image',
		}
		widgets = {
			'file': forms.ClearableFileInput(attrs={'class':'img-upload'}),
			'tags': autocomplete.TaggitSelect2(url='tag-autocomplete')
		}
		help_texts = {
			'tags': 'Tags help people find your content. For example, if you\'ve got a memory of a particular time, you could tag it \'1960s\'.',
		}


class AdminImageForm(ImageForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here. If a contributor has opted out of email updates they won\'t receive this.', required=False, widget=forms.Textarea, initial='Hello.\nYour submission has been published on the Survey of London Whitechapel Website.\nThanks for your contribution.\n\n\nIf you\'d like to stop receiving these emails, log in to your account and uncheck the "Receive emails about your submissions from the Survey of London?" on your profile page.')
	send_email = forms.BooleanField(label='Send Email?', help_text='If you don\'t want to notify a contributor by email that their contribution has been approved, uncheck this box.', initial=True, required=False)
	class Meta(ImageForm.Meta):
		fields = ('title', 'tags', 'description', 'email_thanks', 'send_email', 'published', 'aggregate')
		labels = {
			'title': 'Edit the title',
			'tags': 'Add more tags as necessary',
			'published': 'Tick this box to approve this submission and publish it on the map.',
			'aggregate': 'Tick this box to attach this content to all the buildings on this site.',
		}
		help_texts = {
			'tags': '',
		}


class MediaForm(forms.ModelForm):
	class Meta:
		model = Media
		fields = ('title', 'url', 'tags', 'description')
		labels = {
			'title': 'Give your contribution a title',
			'url': 'Paste a link to YouTube, Vimeo or SoundCloud media here',
			'tags': 'Add one or two tags so people can find your contribution more easily',
			'description': 'Tell us a little about this media',
		}
		widgets = {
			'tags': autocomplete.TaggitSelect2(url='tag-autocomplete')
		}
		help_texts = {
			'tags': 'Tags help people find your content. For example, if you\'ve got a memory of a particular time, you could tag it \'1960s\'.',
		}

class AdminMediaForm(MediaForm):
	email_thanks = forms.CharField(label='Email Content', help_text='Once you\'ve approved this content the submitter will be informed by email that it\'s been added to the map. If you\'d like to add a line or two of thanks or explain why you\'ve made any edits, you can do so here. If a contributor has opted out of email updates they won\'t receive this.', required=False, widget=forms.Textarea, initial='Hello.\nYour submission has been published on the Survey of London Whitechapel Website.\nThanks for your contribution.\n\n\nIf you\'d like to stop receiving these emails, log in to your account and uncheck the "Receive emails about your submissions from the Survey of London?" on your profile page.')
	send_email = forms.BooleanField(label='Send Email?', help_text='If you don\'t want to notify a contributor by email that their contribution has been approved, uncheck this box.', initial=True, required=False)
	class Meta(MediaForm.Meta):
		fields = ('title', 'tags', 'url', 'description', 'email_thanks', 'send_email', 'published', 'aggregate')
		labels = {
			'title': 'Edit the title',
			'tags': 'Add more tags as necessary',
			'url': 'Check to see if the URL is correct',
			'published': 'Tick this box to approve this submission and publish it on the map.',
			'aggregate': 'Tick this box to attach this content to all the buildings on this site.',
		}
		help_texts = {
			'tags': '',
		}

# Admin Action Forms

class AddDescriptionActionForm(forms.Form):
	short_description = forms.CharField(label='Short description')

class AddThumbnailActionForm(forms.Form):
	file = forms.FileField(label='Thumbnail')

class AddAddressActionForm(forms.Form):
	address = forms.CharField(label='Formatted Address')

