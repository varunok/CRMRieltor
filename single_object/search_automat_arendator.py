# -*- coding: utf-8 -*-

from facility.models import ContactOwner
from single_object.models import Tie



def search_automat(request, arendators):
    price_automat = request.get('price_automat')
    rooms_automat = request.get('rooms_automat')
    type_obj_automat = request.get('type_obj_automat')
    area_automat = request.get('area_automat')
    repairs_automat = request.get('repairs_automat')
    district_automat = request.get('district_automat')
    id_so = request.get('id_so')
    contact_owner = ContactOwner.objects.get(id=id_so)
    try:
        if price_automat == 'true':
            arendators = arendators.filter(price_from__lte=contact_owner.price_month,
                                           price_to__gte=contact_owner.price_month)
        if rooms_automat == 'true':
            arendators = arendators.filter(rooms_from__lte=contact_owner.rooms, price_to__gte=contact_owner.rooms)
        if type_obj_automat == 'true':
            arendators = arendators.filter(type_building_data=contact_owner.type_facilit)
        if area_automat == 'true':
            arendators = arendators.filter(area_from__lte=contact_owner.total_area, area_to__gte=contact_owner.total_area)
        if repairs_automat == 'true':
            arendators = arendators.filter(repairs=contact_owner.repairs)
        if district_automat == 'true':
            arendators = arendators.filter(district_obj=contact_owner.district_obj)
        Tie.objects.get(tie_cont_owner=id_so).tie_arenda.clear()
        for arendator in arendators:
            # print (0, arendators)
            # if contact_owner.tie in arendator.tie_set.all():
            #     print ('1',arendators)
            #     arendators = arendators.exclude(tie__in=arendator.tie_set.all())
            #     print ('0',arendators)
            # else:
            tie, created = Tie.objects.get_or_create(tie_cont_owner=contact_owner)
            if Tie.objects.filter(tie_arenda=arendator, tie_cont_owner=contact_owner).exists() == False:
                tie.tie_arenda.add(arendator)
    except:
        return arendators


    return arendators
