# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from facility.models import ContactOwner
from arendator.models import Arendator
from buyer.models import Buyer
from meeting.models import Meeting, UserFullName, TypeStatus
from meeting.forms import MeetingForm
# Create your views here.


def get_form_task(request, form=MeetingForm()):
    form.fields['meet_facility'].queryset = ContactOwner.objects.filter(trash=False)
    form.fields['meet_arendator'].queryset = Arendator.objects.filter(trash=False)
    form.fields['meet_buyer'].queryset = Buyer.objects.filter(trash=False)
    form.fields['rieltor'].queryset = UserFullName.objects.filter(is_active=True)
    form.fields['access'].queryset = UserFullName.objects.filter(is_active=True)
    if form.errors:
        return render(request, 'meeting/form.html', {"form": form}, status=500)
    return render(request, 'meeting/form.html', {"form": form})


def save_form_meeting(request):
    if request.method == 'POST':
        form = MeetingForm(request.POST)
        if form.is_valid():
            form.save()
            meet = Meeting.objects.filter().order_by('id').last()
            return single_task(request, meet)
        else:
            form = MeetingForm(request.POST)
            return get_form_task(request,form)


def single_task(request, meet):
    status_list = TypeStatus.objects.all()
    return render(request, 'meeting/single_meet.html', {"meeting": meet, "status_list": status_list})


def to_archive(request):
    if request.method == 'POST':
        task = Meeting.objects.get(id=request.POST['id'])
        task.meet_archiv = True
        task.save()
        return HttpResponse(status=200)
    else:
        return HttpResponse(status=500)


def edit_form(request):
    if request.method == 'POST':
        meeting = Meeting.objects.get(id=request.POST.get('id'))
        form = MeetingForm(instance=meeting)
        return render(request, 'meeting/form.html', {"form": form})
