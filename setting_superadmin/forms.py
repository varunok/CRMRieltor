# -*- coding: utf-8 -*-


from django.forms import ModelForm, TextInput, RadioSelect, Select
from setting_superadmin.models import AllToCall, AllToConnect


class AllToCallForm(ModelForm):
    class Meta:
        model = AllToCall
        fields = ('phone', 'email', 'skype', 'group_vk')
        widgets = {
            'phone': TextInput(attrs={}),
            'email': TextInput(attrs={}),
        }



class AllToConnectForm(ModelForm):
    class Meta:
        model = AllToConnect
        fields = ('email',)
        widgets = {
            'email': TextInput(attrs={}),
        }