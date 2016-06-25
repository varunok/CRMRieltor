# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from setting_street.models import TypesStreet, Street


# Create your views here.
def street_list(request):
    type_street = TypesStreet.objects.all()
    list_street = Street.objects.all()
    return render(request,
                  'setting_street/setting_street.html', {'type_street':type_street, 'list_street': list_street})


def add_street(request):
    results = request.GET
    try:
        if Street.objects.get(street__iexact=results.get('name_street')):
            return HttpResponse("Значение присутствует")
    except Exception, e:
        add_type_street = TypesStreet.objects.filter(id=results.get("id_short"))
        add_street = Street(street=results.get('name_street'),
                            type_street_group=add_type_street[0])
        add_street.save()
        response_street = {"type_street": add_type_street[0].short_name,
                           "name_street": add_street.street}
        json = JsonResponse(response_street)
        return HttpResponse(json)

def delete_street(request):
    results = request.GET
    result = results.get('id_street')
    Street.objects.filter(id=int(result)).delete()
    return HttpResponse("object delete")
