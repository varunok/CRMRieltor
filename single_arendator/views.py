# -*- coding: utf-8 -*-


# Create your views here.
from django.shortcuts import render
from django.views.generic import DetailView
from arendator.models import Arendator, TypeState
from facility.models import NationalCarrency



class SingleArendatorView(DetailView):
    """docstring for SingleObjectView"""
    model = Arendator
    slug_url_kwarg = 'aid'
    slug_field = 'id'
    template_name = 'single_arendator/single_arendator.html'
    context_object_name = 'single_arendator'

    def get_context_data(self, **kwargs):
        self.context = super(SingleArendatorView, self).get_context_data(**kwargs)
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['list_state'] = TypeState.objects.all()
        return self.context