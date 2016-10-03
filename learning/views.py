# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from learning.forms import LearnForm
from learning.models import Learn


def get_learn_list(request):
    learning = Learn.objects.all()
    return render(request, 'learning/learn.html', {'learning': learning})


def add_learning(request):
    form = LearnForm()
    return render(request, 'learning/add_learning.html', {'form': form})


def add_learn_form(request):
    if request.method == 'POST':
        form = LearnForm(request.POST)
        if form.is_valid():
            form.save()
            # return render(request, 'learning/learn.html', {'learning': learning})
            return HttpResponseRedirect('get_learn_list')
    else:
        form = LearnForm()
    return render(request, 'learning/add_learning.html', {'form': form})
