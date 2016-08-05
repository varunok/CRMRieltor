# -*- coding: utf-8 -*-


from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.utils import timezone
from setting_superadmin.forms import AllToCallForm
from setting_superadmin.models import AllToCall

# Create your views here.



def list_setting_superadmin(request):
    return render(request, 'setting_superadmin/list_settings.html', {'time': timezone.now()})


def all_to_call(request, form=AllToCallForm()):
    try:
        post = get_object_or_404(AllToCall, pk=1)
        print(post)
        form = AllToCallForm(instance=post)
    except:
        pass
    return render(request, 'setting_superadmin/all_to _call.html', {'time': timezone.now(),
                                                                    'form': form})


def save_call(request):
    if request.method == 'POST':
        try:
            post = get_object_or_404(AllToCall, pk=1)
            print(post)
            form = AllToCallForm(request.POST, instance=post)
        except:
            form = AllToCallForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/list_setting_superadmin')
        else:
            return all_to_call(request, form)
    return HttpResponseRedirect('/list_setting_superadmin')
