# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils import timezone, dateformat
from itertools import chain


from notes.models import Notes
from setting_street.models import Street, District, Subway
from facility.forms import AddressFacilityForm
from facility.models import AddressFacilityData, ContactOwner, ImagesFacility, TypeOperations, TypeFacility, TypeActuality
from setting_globall.models import NationalCarrency
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

    order_by = request.GET.get('order_by', '')
    if order_by in ('id', 'price_bay', 'price_month', 'total_area', 'date_of_renovation', 'review_date'):
        contact_owner = contact_owner.order_by(order_by)
    if request.GET.get('reverse', '') == '1':
        contact_owner = contact_owner.reverse()

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
    nac_carrency = NationalCarrency.objects.get(id=1)
    type_facility = TypeFacility.objects.all()
    list_carrency = NationalCarrency.objects.all()
    type_actuality = TypeActuality.objects.all()
    list_district = District.objects.all()
    return render(request, 'homes/objects.html', {'time': timezone.now(),
                                                  'addres_facility_data_list': addres_facility_data_list,
                                                  'contact_owner': contact_owner,
                                                  'images': images,
                                                  'nac_carrency': nac_carrency,
                                                  'all_contact_owner_se': all_contact_owner_se,
                                                  'all_contact_owner_ad': all_contact_owner_ad,
                                                  'all_contact_owner': all_contact_owner,
                                                  'type_facility': type_facility,
                                                  'list_carrency': list_carrency,
                                                  'type_actuality': type_actuality,
                                                  'list_district': list_district})

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
