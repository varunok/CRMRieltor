# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils import timezone, dateformat
from itertools import chain


from notes.models import Notes
from setting_street.models import Street, District, Subway
from facility.forms import AddressFacilityForm
from facility.models import AddressFacilityData, ContactOwner, ImagesFacility, TypeOperations
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
@login_required
def homes(request):
    notes = Notes.objects.all()
    return render(request, 'homes/index.html', {'notes': notes, 'time': timezone.now()})


@login_required
def object_list(request, arg='objects'):
    all_contact_owner = ContactOwner.objects.all()
    all_contact_owner_se = ContactOwner.objects.filter(list_operations__in=[1,4])
    all_contact_owner_ad = ContactOwner.objects.filter(list_operations__in=[2,3])
    if arg=='selling':
        contact_owner = ContactOwner.objects.filter(list_operations__in=[1,4])
    elif arg=='arend':
        contact_owner = ContactOwner.objects.filter(list_operations__in=[2,3])
    else:
        contact_owner = ContactOwner.objects.all()
    paginator = Paginator(contact_owner, 10)
    page = request.GET.get('page')
    try:
        contact_owner = paginator.page(page)
    except PageNotAnInteger:
        contact_owner = paginator.page(1)
    except EmptyPage:
        contact_owner = paginator.page(paginator.num_pages)
    addres_facility_data_list = AddressFacilityData.objects.all()
    images = ImagesFacility.objects.all()
    return render(request, 'homes/objects.html', {'time': timezone.now(),
                                                  'addres_facility_data_list': addres_facility_data_list,
                                                  'contact_owner': contact_owner,
                                                  'images': images,
                                                  'all_contact_owner_se': all_contact_owner_se,
                                                  'all_contact_owner_ad': all_contact_owner_ad,
                                                  'all_contact_owner': all_contact_owner})

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
def add_object(request, form = AddressFacilityForm()):
    street_list = Street.objects.all()
    district_list = District.objects.all()
    subway_list = Subway.objects.all()
    return render(request,
                  'homes/add_object.html', {'form':form,
                                            'street_list': street_list,
                                            'district_list': district_list,
                                            'subway_list': subway_list,
                                            'time': timezone.now()})

@login_required
def tasking(request):
    return render(request, 'homes/tasking.html', {'time': timezone.now()})

@login_required
def setting(request):
    return render(request, 'homes/setting.html', {'time': timezone.now()})

@login_required
def meeting(request):
    return render(request, 'homes/meeting.html', {'time': timezone.now()})
