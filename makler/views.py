# -*- coding: utf-8 -*-


from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from makler.forms import MaklerForm
from makler.models import Makler, TypeCooperations
from homes.views import MaklerList
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required

# Create your views here.


class MaklerListWhite(MaklerList):
    qeryset = Makler.objects.filter(white_black=1)

    def get_queryset(self):
        return self.qeryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(MaklerListWhite, self).dispatch(request, *args, **kwargs)


class MaklerListBlack(MaklerList):
    qeryset = Makler.objects.filter(white_black=2)

    def get_queryset(self):
        return self.qeryset

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(MaklerListBlack, self).dispatch(request, *args, **kwargs)


@login_required
def search_makler(request):
    if request.method == 'POST':
        queryset = Makler.objects.all()
        if request.POST.get('search_makler_number'):
            queryset = queryset.filter(phone__icontains=request.POST.get('search_makler_number'))
        if (request.POST.get('search_cooperation')).isdigit():
            type_coop = TypeCooperations.objects.filter(id=request.POST.get('search_cooperation'))
            queryset = queryset.filter(cooperation=type_coop)
        return render(request, 'makler/list_makler.html', {"maklers": queryset})


@login_required
def add_makler(request):
    if request.method == 'POST':
        form = MaklerForm(request.POST)
        if form.is_valid():
            form.save()
            post = Makler.objects.last()
            return render(request, 'makler/single_makler.html', {"makler": post})
        else:
            # form = change_form_text(form)
            form = MaklerForm(request.POST)
        return form_makler(request, form)
    else:
        return HttpResponse(status=404)


@login_required
def form_makler(request, form=MaklerForm()):
    if form.errors:
        return render(request, 'makler/form.html', {"form": form}, status=404)
    return render(request, 'makler/form.html', {"form": form})


@login_required
def edit_makler(request):
    if request.method == 'POST':
        post = get_object_or_404(Makler, pk=request.POST.get('id'))
        form = MaklerForm(instance=post)
        return render(request, 'makler/edit_makler.html', {"form": form, "id_makler": post})
    else:
        return HttpResponse(status=404)


@login_required
def save_edit_makler(request, id):
    if request.method == 'POST':
        post = get_object_or_404(Makler, pk=id)
        form = MaklerForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
            return render(request, 'makler/single_makler.html', {"makler": post})
        else:
            form = MaklerForm(request.POST, instance=post)
            return render(request, 'makler/edit_makler.html', {"form": form, "id_makler": post}, status=404)
    else:
        return HttpResponse(status=404)
