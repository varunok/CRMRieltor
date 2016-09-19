# -*- coding: utf-8 -*-


from django.forms import ModelForm, SelectMultiple, Textarea
from meeting.models import Meeting


class MeetingForm(ModelForm):
    class Meta:
        model = Meeting
        fields = ('meet_date', 'meet_facility', 'meet_arendator', 'meet_buyer', 'access', 'rieltor', 'meet_status',
                  'meet_comment')
        widgets = {
            'access': SelectMultiple(attrs={'class': 'multiple', 'multiple': 'multiple'}),
            'meet_comment': Textarea(attrs={'cols': '30', 'rows': '7'})
        }

