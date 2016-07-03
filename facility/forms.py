# -*- coding: utf-8 -*-


from django.forms.models import modelformset_factory
from facility.models import AddressFacilityData, ContactOwner
from django.forms import ModelForm, Select, Textarea, TextInput, SelectMultiple, RadioSelect




class AddressFacilityForm(ModelForm):
    class Meta(object):
        model = ContactOwner
        fields = (
            'type_facilit', 'street_obj', 'district_obj', 'subway_obj', 'number_home', 'number_apartment', 'price_bay',
            'price_month', 'list_operations', 'contact_owner')
        widgets = {
            'street_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'district_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'subway_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'number_home': TextInput(attrs={'placeholder': 'Дом'}),
            'number_apartment': TextInput(attrs={'placeholder': 'Квартира'}),
            'list_operations': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'contact_owner': RadioSelect(attrs={'class': 'tarea-multiple col-md-6', 'multiple': 'multiple'}),
        }
