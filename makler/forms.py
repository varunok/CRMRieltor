# -*- coding: utf-8 -*-


from django.forms import ModelForm, TextInput, RadioSelect, Select
from makler.models import Makler

class MaklerForm(ModelForm):


    class Meta:
        model = Makler
        error_css_class = 'error_new'
        required_css_class = 'required_new'
        fields = ('name', 'agency', 'cooperation', 'email', 'phone', 'site', 'white_black')
        widgets = {
            'phone': TextInput(attrs={}),
            'email': TextInput(attrs={}),
            'site': TextInput(attrs={}),
            'white_black': Select(attrs={'style': 'min-width: 100%' }),
            'cooperation': Select(attrs={'style': 'min-width: 100%' }),
        }