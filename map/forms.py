from django import forms
from map.models import Feature, Document

class FeatureForm(forms.ModelForm):
	class Meta:
		model = Feature
		fields = ('geom', 'b_number', 'b_name', 'street', 'postcode', 'address', 'b_type', 'original', 'rebuild_1', 'rebuild_2', 'f_date', 'storeys', 'basement', 'architect', 'builders', 'materials', 'type', 'c_area', 'listed', 'count', 'categories', 'thumbnail', 'tags', 'banner')
		widgets = {
			'basement': forms.CheckboxInput(),
			'c_area': forms.CheckboxInput(),
			'listed':  forms.CheckboxInput(),
		}

class DocumentForm(forms.ModelForm):
	class Meta:
		model = Document
		fields = ('title', 'body',)
		labels = {
			'title': '',
			'body': '',
		}