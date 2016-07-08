# -*- coding: utf-8 -*-


from facility.models import AddressFacilityData, ContactOwner
from django.forms import ModelForm, Select, Textarea, TextInput, SelectMultiple, RadioSelect, CheckboxInput



class AddressFacilityForm(ModelForm):
    class Meta(object):
        model = ContactOwner
        fields = (
            'type_facilit', 'street_obj', 'district_obj', 'subway_obj', 'number_home', 'number_apartment', 'price_bay',
            'price_month', 'list_operations', 'contact_owner', 'agency', 'name_owner', 'review_date', 'call_date',
            'email_owner', 'vip_owner', 'phone_owner', 'phone_owner_plus', 'type_building_data', 'repairs', 'landmark',
            'number_of_floors', 'floors_up', 'first_floor', 'last_floor', 'floor', 'area_badroom', 'area_extra_room',
            'area_kitchen', 'area_living_room', 'total_area', 'payments', 'rooms', 'comment', 'rieltor', 'loyality',
            'actuality', 'condition', 'commission', 'currency')
        widgets = {
            'street_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'currency': Select(attrs={'class': 'add'}),
            'district_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'subway_obj': Select(attrs={'class': 'js-example-basic-single'}),
            'number_home': TextInput(attrs={'placeholder': 'Дом'}),
            'number_apartment': TextInput(attrs={'placeholder': 'Квартира'}),
            'list_operations': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'rieltor': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'loyality': SelectMultiple(attrs={'class': 'tarea-multiple', 'multiple': 'multiple'}),
            'contact_owner': RadioSelect(attrs={'class': 'col-md-6'}),
            'vip_owner': CheckboxInput(),
            # 'first_floor': CheckboxInput(attrs={'checked': 'unchecked'}),
            # 'last_floor': CheckboxInput(),
            'number_of_floors': TextInput(attrs={'placeholder': 'От'}),
            'floors_up': TextInput(attrs={'placeholder': 'До'}),
            'comment': Textarea(attrs={'rows': '4'}),
            'landmark': TextInput(attrs={'placeholder': '-----'}),
            'floor': TextInput(attrs={'placeholder': '-----'}),
            'area_badroom': TextInput(attrs={'placeholder': 'Спальня'}),
            'area_kitchen': TextInput(attrs={'placeholder': 'Кухня'}),
            'area_living_room': TextInput(attrs={'placeholder': 'Гостинная'}),
            'area_extra_room': TextInput(attrs={'placeholder': 'Доп.комната'}),
            'payments': TextInput(attrs={'placeholder': '(комунальные)'}),
            'rooms': TextInput(attrs={'placeholder': '-----'}),
            'total_area': TextInput(attrs={'placeholder': '-----'}),
        }

