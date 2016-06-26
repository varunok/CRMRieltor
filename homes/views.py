# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils import timezone, dateformat


from notes.models import Notes
from setting_street.models import Street


# Create your views here.
@login_required
def homes(request):
    notes = Notes.objects.all()
    return render(request, 'homes/index.html', {'notes': notes, 'time': timezone.now()})

@login_required
def object_list(request):
    return render(request, 'homes/objects.html', {'time': timezone.now()})

@login_required
def buyers_list(request):
    return render(request, 'homes/buyers.html', {'time': timezone.now()})

@login_required
def maklers_list(request):
    return render(request, 'homes/maklers.html', {'time': timezone.now()})

@login_required
def arendators_list(request):
    return render(request, 'homes/arendators.html', {'time': timezone.now()})

@login_required
def add_buyer(request):
    return render(request, 'homes/add_buyer.html', {'time': timezone.now()})

@login_required
def add_arendator(request):
    return render(request, 'homes/add_arendator.html', {'time': timezone.now()})

@login_required
def add_object(request):
    street_list = Street.objects.all()
    return render(request,
                  'homes/add_object.html', {'street_list': street_list, 'time': timezone.now()})

@login_required
def tasking(request):
    return render(request, 'homes/tasking.html', {'time': timezone.now()})

@login_required
def setting(request):
    return render(request, 'homes/setting.html', {'time': timezone.now()})

@login_required
def meeting(request):
    return render(request, 'homes/meeting.html', {'time': timezone.now()})
