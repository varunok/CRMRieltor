# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.utils import timezone, dateformat
from datetime import datetime
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from facility.models import ContactOwner, DatabasePhoneOwner


def searh(request, list_var):
    list_req = request.GET
    type_facility_l = list_req.getlist('type_facility[]')
    contact_owner = ContactOwner.objects.all()
    if type_facility_l:
        contact_owner = ContactOwner.objects.filter(list_operations__in=type_facility_l)
    if list_req.get('carrency') == '1':
        if list_req.get('price_on'):
            contact_owner = contact_owner.filter(price_month__gte=int(list_req.get('price_on')))
        if list_req.get('price_for'):
            contact_owner = contact_owner.filter(price_month__lte=int(list_req.get('price_for')))
    else:
        if list_req.get('price_on'):
            contact_owner = contact_owner.filter(price_bay__gte=int(list_req.get('price_on')))
        if list_req.get('price_for'):
            contact_owner = contact_owner.filter(price_bay__lte=int(list_req.get('price_for')))
    if list_req.get('actuality') != '-----':
        contact_owner = contact_owner.filter(actuality__in=list_req.get('actuality'))
    if list_req.getlist('district[]'):
        contact_owner = contact_owner.filter(district_obj__in=list_req.getlist('district[]'))
    if list_req.get('area_for'):
        contact_owner = contact_owner.filter(total_area__gte=int(list_req.get('area_for')))
    if list_req.get('area_to'):
        contact_owner = contact_owner.filter(total_area__lte=int(list_req.get('area_to')))
    if list_req.get('condition') != '-----':
        contact_owner = contact_owner.filter(condition__in=list_req.get('condition'))
    if list_req.get('id_obj'):
        contact_owner = contact_owner.filter(id=list_req.get('id_obj'))
    if list_req.get('phone_obj'):
        phone = DatabasePhoneOwner.objects.filter(db_phone_owner=list_req.get('phone_obj'))
        contact_owner = contact_owner.filter(id__in=phone)
    if list_req.get('peresmotr'):
        date_old = datetime.strptime(str(list_req.get('peresmotr')), "%m/%d/%Y")
        formatted_date = dateformat.format(datetime.now(), 'Y-m-d')
        peresmotr_reformat = dateformat.format(date_old, 'Y-m-d')
        print(formatted_date, peresmotr_reformat)
        contact_owner = contact_owner.filter(review_date__range=(formatted_date, peresmotr_reformat))


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
    list_var['contact_owner'] = contact_owner
    return list_var
