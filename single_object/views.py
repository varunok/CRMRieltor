# -*- coding: utf-8 -*-


from django.shortcuts import render


# Create your views here.
from django.shortcuts import render
from django.utils import timezone, dateformat
from datetime import datetime
from django.http import HttpResponse,  JsonResponse
from django.views.generic import DetailView

from django.contrib.auth.models import User
from facility.models import ContactOwner, ImagesFacility, NationalCarrency, TypeActuality
from single_object.models import SingleObjComments, Tie, TypeShows, ShowsArendator
from extuser.models import MyUser
from arendator.models import Arendator


class SingleObjectView(DetailView):
    """docstring for SingleObjectView"""
    model = ContactOwner
    slug_url_kwarg = 'oid'
    slug_field = 'id'
    template_name = 'single_object/single_object.html'
    context_object_name = 'single_object'

    def get_context_data(self, **kwargs):
        self.context = super(SingleObjectView, self).get_context_data(**kwargs)
        self.context['time'] = timezone.now()
        self.context['images'] = ImagesFacility.objects.all().filter(album=self.context['single_object'].id)
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['type_actuality'] = TypeActuality.objects.all()
        self.context['single_obj_comments'] = SingleObjComments.objects.filter(obj_comments=self.context['single_object'].id)
        self.context['count_arendator'] = Tie.objects.get(tie_cont_owner=self.context['single_object'].id).tie_arenda.all().count()
        return self.context


def change_call_date(request):
    try:
        date_request = datetime.strptime(str(request.GET['data']), "%m/%d/%Y")
        date_change = dateformat.format(date_request, 'Y-m-d')
        con_owner = ContactOwner.objects.get(id=request.GET['id'])
        con_owner.call_date = date_change
        con_owner.save()
        return HttpResponse("ok")
    except:
        return HttpResponse("error")


def change_review_date(request):
    date_request = datetime.strptime(str(request.GET['data']), "%m/%d/%Y")
    date_change = dateformat.format(date_request, 'Y-m-d')
    con_owner = ContactOwner.objects.get(id=request.GET['id'])
    con_owner.review_date = date_change
    con_owner.save()
    return HttpResponse("ok")


def change_actuality(request):
    con_owner = ContactOwner.objects.get(id=request.GET['id'])
    actual = TypeActuality.objects.get(id=request.GET['data'])
    con_owner.actuality = actual
    con_owner.save()
    return HttpResponse("ok")


def add_obj_comment(request):
    author = User.objects.get(id=request.POST['id_user'])
    author_name = author.get_full_name()
    singl_obj = ContactOwner.objects.get(id=request.POST['id_single_obj'])
    image = MyUser.objects.get(user=author)
    comment = SingleObjComments(obj_comments=singl_obj,
                                comment=unicode(request.POST['text_comment']),
                                author_comment=unicode(author_name),
                                image=unicode(image.image))
    comment.save()
    comments = SingleObjComments.objects.filter(obj_comments=singl_obj).last()
    date_comment = dateformat.format(comments.date_comment, 'd E Y H:i')
    comment_data = JsonResponse({
        "text": comments.comment,
        "author": comments.author_comment,
        "date": date_comment,
        "image": str(image.image)
        })
    return HttpResponse(comment_data)


def del_comment(request):
    if request.method == 'POST':
        id_comment = request.POST.get('id_comment').split('_')[-1]
        SingleObjComments.objects.get(id=id_comment).delete()
        return HttpResponse('comment delete')
    else:
        return HttpResponse('error delete')


def get_arendator(request):
    ties = Tie.objects.all()
    singl_obg = ContactOwner.objects.get(id=request.GET.get('id_so'))
    count_arendator = Tie.objects.get(tie_cont_owner=singl_obg).tie_arenda.all().count()
    type_shows = TypeShows.objects.all()
    nac_carrency = NationalCarrency.objects.get(id=1)
    shows = ShowsArendator.objects.all()
    return render(request, 'single_object/arendator.html', {"ties": ties,
                                                            "singl_obj": singl_obg,
                                                            "display": True,
                                                            "error": True,
                                                            "type_shows": type_shows,
                                                            "nac_carrency": nac_carrency,
                                                            "shows_arendator": shows,
                                                            "count_arendator": count_arendator})


def get_buyer(request):
    return render(request, 'single_object/buyers.html', {})


def get_publication(request):
    return render(request, 'single_object/publication.html', {})


def get_meetings(request):
    return render(request, 'single_object/meetings.html', {})


def get_tasks(request):
    return render(request, 'single_object/tasks.html', {})


def get_comment(request):
    data_comment = SingleObjComments.objects.filter(obj_comments=request.GET['id_so'])
    return render(request, 'single_object/comments.html', {"single_obj_comments": data_comment})


class DatabasesPrevious(SingleObjectView):
    slug_url_kwarg = 'poid'
    slug_field = 'id'
    template_name = 'single_object/previous.html'

def add_arendator_to_tie(request):
    return HttpResponse('ok')


class AddArendatorToTie(DetailView):
    model = Arendator
    slug_url_kwarg = 'idu'
    slug_field = 'id'
    template_name = 'single_object/return_table/single_table.html'
    context_object_name = 'arendator'

    def get_context_data(self, **kwargs):
        self.context = super(AddArendatorToTie, self).get_context_data(**kwargs)
        self.context['type_shows'] = TypeShows.objects.all()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['show_arendators'] = ShowsArendator.objects.all()
        self.context['error'] = True
        return self.context

    def get(self, request, *args, **kwargs):
        if Arendator.objects.filter(id=self.kwargs['idu'], trash=False).exists():
            arendator = Arendator.objects.get(id=self.kwargs['idu'], trash=False)
        else:
            return HttpResponse(status=404)
        cont_owner = ContactOwner.objects.get(id=self.request.GET.get('id'))
        # self.context['count_arendator'] = Tie.objects.get(tie_cont_owner=cont_owner).tie_arenda.all().count()
        tie, created = Tie.objects.get_or_create(tie_cont_owner=cont_owner)
        if Tie.objects.filter(tie_arenda=arendator, tie_cont_owner=cont_owner).exists() == False:
            tie.tie_arenda.add(arendator)
        else:
            return HttpResponse(status=404)
        self.object = self.get_object()
        context = self.get_context_data(object=self.object)
        return self.render_to_response(context)

def change_shows(request, id_a):
    try:
        id_a, id_o, id_show = id_a.split('=')
        id_a = id_a.split('-')[-1]
        id_o = id_o.split('-')[-1]
        id_show = id_show.split('-')[-1]
        type_shows = TypeShows.objects.get(id=id_show)
        arendator = Arendator.objects.get(id=id_a)
        cont_owner = ContactOwner.objects.get(id=id_o)
        show_ar, created = ShowsArendator.objects.get_or_create(array_arendator=arendator, array_cont_ower=cont_owner)
        show_ar.type_shows_arendator = type_shows
        show_ar.save()
        return HttpResponse('ok')
    except:
        return HttpResponse('error')

def automat_tie(request):
    return HttpResponse('ok')