# -*- coding: utf-8 -*-


from django.forms import ModelForm, TextInput, RadioSelect, Select, SelectMultiple
from tasking.models import Tasking


class TaskingForm(ModelForm):
    class Meta:
        model = Tasking
        fields = ('dead_line', 'access', 'rieltor', 'type_complex', 'task_facility',\
                  'task_arendator', 'task_buyer', 'task_text')

        widgets = {
            'access': SelectMultiple(attrs={'class': 'multiple', 'multiple': 'multiple'}),
            'rieltor': Select(attrs={}),
        }
