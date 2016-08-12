# -*- coding: utf-8 -*-


from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from tasking.forms import TaskingForm


def get_form_task(request, form=TaskingForm()):
    return render(request, 'tasking/form.html', {"form": form})
