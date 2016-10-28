# -*- coding: utf-8 -*-


from django.utils import timezone, dateformat
from datetime import datetime
from facility.models import ContactOwner, DatabasePhoneOwner


def searh(request):
    list_req = request.GET
    if 'selling' in request.path.split('/'):
        contact_owner = ContactOwner.objects.filter(list_operations__in=[1, 4])
    elif 'arend' in request.path.split('/'):
        contact_owner = ContactOwner.objects.filter(list_operations__in=[2, 3])
    else:
        contact_owner = ContactOwner.objects.all()
    try:
        if list_req.getlist('type_facility'):
            contact_owner = contact_owner.filter(type_facilit__in=list_req.getlist('type_facility'))
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
        if list_req.get('actuality'):
            contact_owner = contact_owner.filter(actuality__in=list_req.getlist('actuality'))
        if list_req.getlist('district'):
            contact_owner = contact_owner.filter(district_obj__in=list_req.getlist('district'))
        if list_req.get('area_for'):
            contact_owner = contact_owner.filter(total_area__gte=int(list_req.get('area_for')))
        if list_req.get('area_to'):
            contact_owner = contact_owner.filter(total_area__lte=int(list_req.get('area_to')))
        if list_req.get('condition'):
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
            contact_owner = contact_owner.filter(review_date__range=(formatted_date, peresmotr_reformat))
        if list_req.get('floor_for'):
            contact_owner = contact_owner.filter(number_of_floors__lte=int(list_req.get('floor_for')))
        if list_req.get('floor_to'):
            contact_owner = contact_owner.filter(floors_up__gte=int(list_req.get('floor_to')))
        if list_req.get('list_rooms'):
            contact_owner = contact_owner.filter(room__in=list_req.get('list_rooms'))
        if list_req.get('street_obj'):
            contact_owner = contact_owner.filter(street_obj__exact=list_req.get('street_obj'))
        if list_req.get('floor_ot'):
            contact_owner = contact_owner.filter(floor__gte=int(list_req.get('floor_ot')))
        if list_req.get('floor_do'):
            contact_owner = contact_owner.filter(floor__lte=int(list_req.get('floor_do')))
        if list_req.get('rooms_ot'):
            contact_owner = contact_owner.filter(rooms__gte=int(list_req.get('rooms_ot')))
        if list_req.get('rooms_do'):
            contact_owner = contact_owner.filter(rooms__lte=int(list_req.get('rooms_do')))
        if list_req.get('number_home'):
            contact_owner = contact_owner.filter(number_home=int(list_req.get('number_home')))
        if list_req.get('name_owner'):
            contact_owner = contact_owner.filter(name_owner__icontains=list_req.get('name_owner'))
        if list_req.get('kitchen_ot'):
            contact_owner = contact_owner.filter(area_kitchen__gte=int(list_req.get('kitchen_ot')))
        if list_req.get('kitchen_do'):
            contact_owner = contact_owner.filter(area_kitchen__lte=int(list_req.get('kitchen_do')))
        if list_req.get('type_building'):
            contact_owner = contact_owner.filter(type_building_data__in=list_req.getlist('type_building'))
        if list_req.get('comments') != '-----':
            contact_owner = contact_owner.filter(comment__icontains=list_req.get('comments'))
        if list_req.get('vip_status') == 'on':
            contact_owner = contact_owner.filter(vip_owner=list_req.get('vip_status'))
        if list_req.get('public_status') == 'on':
            contact_owner = contact_owner.filter(public=list_req.get('public_status'))
        if list_req.getlist('rieltor'):
            contact_owner = contact_owner.filter(rieltor__in=list_req.getlist('rieltor'))
        if list_req.getlist('list_subway'):
            contact_owner = contact_owner.filter(subway_obj__in=list_req.getlist('list_subway'))
        if list_req.get('first_floor') == 'on':
            contact_owner = contact_owner.filter(first_floor=list_req.get('first_floor'))
        if list_req.get('last_floor') == 'on':
            contact_owner = contact_owner.filter(last_floor=list_req.get('last_floor'))
        if list_req.getlist('number_of_persons'):
            contact_owner = contact_owner.filter(number_of_persons__in=list_req.getlist('number_of_persons'))
        if list_req.get('lot'):
            contact_owner = contact_owner.filter(lot=int(list_req.get('lot')))
        if list_req.get('type_windows'):
            contact_owner = contact_owner.filter(windows__in=list_req.getlist('type_windows'))
        if list_req.getlist('type_equipment'):
            contact_owner = contact_owner.filter(equipment__in=list_req.getlist('type_equipment'))
        if list_req.get('sleeps'):
            contact_owner = contact_owner.filter(sleeps=int(list_req.get('sleeps')))
        if list_req.getlist('type_where_to_stay'):
            contact_owner = contact_owner.filter(where_to_stay__in=list_req.getlist('type_where_to_stay'))
        if list_req.get('type_heating'):
            contact_owner = contact_owner.filter(heating__in=list_req.getlist('type_heating'))
        if list_req.getlist('type_the_presence_of_hot_water'):
            contact_owner = contact_owner.filter(the_presence_of_hot_water__in=list_req.getlist('type_the_presence_of_hot_water'))
        if list_req.get('type_prepayment'):
            contact_owner = contact_owner.filter(prepayment__in=list_req.getlist('type_prepayment'))
        if list_req.get('type_lavatory'):
            contact_owner = contact_owner.filter(lavatory__in=list_req.getlist('type_lavatory'))
        if list_req.get('type_furniture'):
            contact_owner = contact_owner.filter(furniture__in=list_req.getlist('type_furniture'))
    except ValueError:
        pass

    return contact_owner.filter(trash=False)
