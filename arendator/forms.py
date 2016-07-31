# -*- coding: utf-8 -*-


from django import forms
from django.forms import ModelForm, SelectMultiple, Textarea, Select, SelectMultiple, TextInput
from arendator.models import Arendator


class ArendatorForm(ModelForm):
    class Meta(object):
        model = Arendator
        fields = (
            'rieltor', 'loyality', 'commission', 'name', 'type_state', 'type_client', 'phone_first', 'phone_second',
            'comment', 'email', 'district_obj', 'room', 'repairs', 'type_building_data', 'rooms_from', 'rooms_to',
            'floors_from', 'floors_to', 'area_from', 'area_to', 'price_from', 'price_to', 'date_term',
            'number_of_persons', 'type_stage')
        widgets = {
            'rieltor': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'loyality': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'comment': Textarea(attrs={'rows': '7'}),
            'district_obj': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'room': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'repairs': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'type_building_data': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'rooms_from': TextInput(attrs={'placeholder': 'От'}),
            'rooms_to': TextInput(attrs={'placeholder': 'До'}),
            'floors_from': TextInput(attrs={'placeholder': 'От'}),
            'floors_to': TextInput(attrs={'placeholder': 'До'}),
            'area_from': TextInput(attrs={'placeholder': 'От'}),
            'area_to': TextInput(attrs={'placeholder': 'До'}),
            'price_from': TextInput(attrs={'placeholder': 'От'}),
            'price_to': TextInput(attrs={'placeholder': 'До'}),
            'phone_first': TextInput(attrs={'placeholder': '-----'}),
            'phone_second': TextInput(attrs={'placeholder': '-----'}),
        }
