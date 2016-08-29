# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.utils import timezone, dateformat
from django.utils.decorators import method_decorator
from django.views.generic import ListView

from notes.models import Notes
from setting_street.models import Street, District, Subway
from facility.forms import AddressFacilityForm
from arendator.forms import ArendatorForm
from buyer.forms import BuyerForm
from arendator.models import Arendator, TypeState, TypeClient, TypeStage
from buyer.models import Buyer
from facility.models import AddressFacilityData, ContactOwner, ImagesFacility, TypeFacility, \
    TypeActuality, TypeCondition, TypeRooms, TypeBuilding, TypeRepairs, TypeNumberOfPerson
from setting_globall.models import NationalCarrency
from search_home import searh
from extuser.models import MyUser
from makler.models import Makler
from tasking.models import Tasking, UserFullName, TypeComplexity


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
def buyers_list(request):
    return render(request, 'homes/buyers.html', {'time': timezone.now()})


class MaklerList(ListView):
    model = Makler
    paginate_by = 10
    context_object_name = 'maklers'
    template_name = 'homes/maklers.html'
    # qeryset = Makler.objects.all()

    def get_context_data(self, **kwargs):
        self.context = super(MaklerList, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['count_makler'] = Makler.objects.all().count()
        self.context['count_makler_white'] = Makler.objects.filter(white_black=1).count()
        self.context['count_makler_black'] = Makler.objects.filter(white_black=2).count()
        return self.context

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(MaklerList, self).dispatch(request, *args, **kwargs)


@login_required
def arendators_list(request):
    return render(request, 'homes/arendators.html', {'time': timezone.now()})


class ArendatorsList(ListView):
    """docstring for ObjectList"""
    model = Arendator
    paginate_by = 10
    context_object_name = 'arendator_list'
    template_name = 'homes/arendators.html'
    queryset = Arendator.objects.all().filter(trash=False)

    def get_context_data(self, **kwargs):
        self.context = super(ArendatorsList, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['count_arendator'] = len(Arendator.objects.all().filter(trash=False))
        self.context['user_list'] = MyUser.objects.all()
        self.context['list_district'] = District.objects.all()
        self.context['list_state'] = TypeState.objects.all()
        self.context['type_facility'] = TypeFacility.objects.all()
        self.context['list_rooms'] = TypeRooms.objects.all()
        self.context['list_client'] = TypeClient.objects.all()
        self.context['list_stage'] = TypeStage.objects.all()
        self.context['list_repair'] = TypeRepairs.objects.all()
        self.context['list_number_of_persons'] = TypeNumberOfPerson.objects.all()

        return self.context

    def get_queryset(self):
        order_by = self.request.GET.get('order_by', '')
        if order_by in ('id', 'call_date', 'review_date'):
            self.qeryset = self.qeryset.order_by(order_by)
        if self.request.GET.get('reverse', '') == '1':
            self.qeryset = self.qeryset.reverse()
        return self.qeryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(ArendatorsList, self).dispatch(request, *args, **kwargs)


@login_required
def add_arendator(request, form=ArendatorForm()):
    return render(request, 'homes/add_arendator.html', {'time': timezone.now(),
                                                        'form': form})


class BuyersList(ListView):
    """docstring for ObjectList"""
    model = Buyer
    paginate_by = 10
    context_object_name = 'buyer_list'
    template_name = 'homes/buyers.html'
    queryset = Buyer.objects.all().filter(trash=False)

    def get_context_data(self, **kwargs):
        self.context = super(BuyersList, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['count_arendator'] = len(Buyer.objects.all().filter(trash=False))
        self.context['user_list'] = MyUser.objects.all()
        self.context['list_district'] = District.objects.all()
        self.context['list_state'] = TypeState.objects.all()
        self.context['type_facility'] = TypeFacility.objects.all()
        self.context['list_rooms'] = TypeRooms.objects.all()
        self.context['list_client'] = TypeClient.objects.all()
        self.context['list_stage'] = TypeStage.objects.all()
        self.context['list_repair'] = TypeRepairs.objects.all()
        self.context['list_number_of_persons'] = TypeNumberOfPerson.objects.all()
        return self.context

    def get_queryset(self):
        order_by = self.request.GET.get('order_by', '')
        if order_by in ('id', 'call_date', 'review_date'):
            self.queryset = self.queryset.order_by(order_by)
        if self.request.GET.get('reverse', '') == '1':
            self.queryset = self.queryset.reverse()
        return self.queryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(BuyersList, self).dispatch(request, *args, **kwargs)

@login_required
def add_buyer(request, form=BuyerForm()):
    return render(request, 'homes/add_buyer.html', {'time': timezone.now(),
                                                    'form': form})
class TaskingList(ListView):
    model = Tasking
    paginate_by = 10
    context_object_name = 'tasking_list'
    template_name = 'homes/tasking.html'
    queryset = Tasking.objects.filter(task_trash=False, task_archiv=False)

    def get_context_data(self, **kwargs):
        self.context = super(TaskingList, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['count_active_task'] = Tasking.objects.filter(task_trash=False, task_archiv=False).count()
        self.context['count_archive_task'] = Tasking.objects.filter(task_trash=False, task_archiv=True).count()
        self.context['rieltor_list'] = UserFullName.objects.filter(is_active=True)
        self.context['complexity_list'] = TypeComplexity.objects.all()
        return self.context


    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(TaskingList, self).dispatch(request, *args, **kwargs)


class TaskingListArchive(TaskingList):
    queryset = Tasking.objects.filter(task_trash=False, task_archiv=True)


@login_required
def setting(request):
    return render(request, 'homes/setting.html', {'time': timezone.now()})


@login_required
def meeting(request):
    return render(request, 'homes/meeting.html', {'time': timezone.now()})
