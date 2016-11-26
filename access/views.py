# -*- coding: utf-8 -*-


import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User
from facility.models import ContactOwner, UserFullName
from django.contrib.auth.decorators import login_required


# Create your views here.
@login_required
def access(request):
    users = User.objects.filter(is_active=True).order_by('id')
    facilitys = ContactOwner.objects.all().filter(trash=False).order_by('id')
    return render(request, 'access.html', {"users": users,
                                           "facilitys": facilitys})


@login_required
def change_access_facility(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            user = UserFullName.objects.get(id=data.get(u'id_user'))
            facility = ContactOwner.objects.get(id=data.get(u'id_facility'))
            if user.is_superuser:
                return HttpResponse(status=300, content='Пользователь superuser')
            if data.get(u'checked'):
                facility.loyality.add(user)
            else:
                facility.loyality.remove(user)
            data = JsonResponse({
                'message': u'Доступ изменен',
                'user': str(user),
                'id_facility': facility.id
            })
            return HttpResponse(data)
        except:
            return HttpResponse(status=501)
