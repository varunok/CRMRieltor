# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.utils import timezone, dateformat
from django.utils.decorators import method_decorator

from notes.models import Notes
from setting_street.models import Street, District, Subway
from facility.forms import AddressFacilityForm
from facility.models import AddressFacilityData, ContactOwner, ImagesFacility, TypeFacility, \
    TypeActuality, TypeCondition, TypeRooms, TypeBuilding
from setting_globall.models import NationalCarrency
from search_home import searh
from django.views.generic import ListView


# Create your views here.
@login_required
def homes(request):
    notes = Notes.objects.all()
    return render(request, 'homes/index.html', {'notes': notes, 'time': timezone.now()})


class ObjectList(ListView):
    """docstring for ObjectList"""
    model = ContactOwner
    paginate_by = 10
    context_object_name = 'contact_owner'
    template_name = 'homes/objects.html'
    qeryset = ContactOwner.objects.all().filter(trash=False)

    def get_context_data(self, **kwargs):
        self.context = super(ObjectList, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['images'] = ImagesFacility.objects.all()
        self.context['addres_facility_data_list'] = AddressFacilityData.objects.all()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['all_contact_owner_se'] = ContactOwner.objects.filter(list_operations__in=[1, 4], trash=False)
        self.context['all_contact_owner_ad'] = ContactOwner.objects.filter(list_operations__in=[2, 3], trash=False)
        self.context['all_contact_owner'] = ContactOwner.objects.all().filter(trash=False)
        self.context['type_facility'] = TypeFacility.objects.all()
        self.context['list_carrency'] = NationalCarrency.objects.all()
        self.context['type_actuality'] = TypeActuality.objects.all()
        self.context['list_district'] = District.objects.all()
        self.context['list_street'] = Street.objects.all()
        self.context['list_conditions'] = TypeCondition.objects.all()
        self.context['list_rooms'] = TypeRooms.objects.all()
        self.context['list_rooms'] = TypeRooms.objects.all()
        self.context['type_building_list'] = TypeBuilding.objects.all()
        return self.context

    def get_queryset(self):
        order_by = self.request.GET.get('order_by', '')
        if order_by in ('id', 'price_bay', 'price_month', 'total_area', 'date_of_renovation', 'review_date'):
            self.qeryset = self.qeryset.order_by(order_by)
        if self.request.GET.get('reverse', '') == '1':
            self.qeryset = self.qeryset.reverse()
        return self.qeryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(ObjectList, self).dispatch(request, *args, **kwargs)


class ObjectListSearch(ObjectList):
    """docstring for ObjectListSearch"""
    template_name = "homes/search.html"

    def get_queryset(self):
        return searh(self.request)


class ObjectListSelling(ObjectList):
    qeryset = ContactOwner.objects.filter(list_operations__in=[1, 4], trash=False)


class ObjectListArend(ObjectList):
    qeryset = ContactOwner.objects.filter(list_operations__in=[2, 3], trash=False)


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
def add_object(request, form=AddressFacilityForm()):
    street_list = Street.objects.all()
    district_list = District.objects.all()
    subway_list = Subway.objects.all()
    return render(request,
                  'homes/add_object.html', {'form': form,
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



