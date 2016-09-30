# -*- coding: utf-8 -*-


# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse,  JsonResponse
from datetime import datetime
from django.utils import timezone, dateformat
from django.contrib.auth.models import User
from django.views.generic import DetailView
from arendator.models import Arendator, TypeState
from facility.models import NationalCarrency
from extuser.models import MyUser
from single_arendator.models import SingleArendatorComments, Shows
from single_object.models import Tie, TypeShows
from search_automat import search_automat
from facility.models import ContactOwner


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
        self.context['single_obj_comments'] = SingleArendatorComments.objects.filter(obj_comments=self.context['single_arendator'].id, type_tabs='comments')
        return self.context


# START BLOCK COMMENTS
def get_comment_arendator(request):
    data_comment = SingleArendatorComments.objects.filter(obj_comments=request.GET['id_arendator']).order_by('-date_comment')
    return render(request, 'single_object/comments.html', {"single_obj_comments": data_comment})


def add_single_arendator_comment(request):
    author = User.objects.get(id=request.POST['id_user'])
    author_name = author.get_full_name()
    singl_obj = Arendator.objects.get(id=request.POST['id_single_obj'])
    image = MyUser.objects.get(user=author)
    comment = SingleArendatorComments(obj_comments=singl_obj,
                                      comment=unicode(request.POST['text_comment']),
                                      author_comment=unicode(author_name),
                                      image=unicode(image.image),
                                      type_tabs=request.POST['type_tabs'])
    comment.save()
    comments = SingleArendatorComments.objects.filter(obj_comments=singl_obj).last()
    date_comment = dateformat.format(comments.date_comment, 'd E Y H:i')
    comment_data = JsonResponse({
        "text": comments.comment,
        "author": comments.author_comment,
        "date": date_comment,
        "image": str(image.image),
        "id_comment": comments.id
    })
    return HttpResponse(comment_data)


def del_comment(request):
    if request.method == 'POST':
        id_comment = request.POST.get('id_comment').split('_')[-1]
        SingleArendatorComments.objects.get(id=id_comment).delete()
        return HttpResponse('comment delete')
    else:
        return HttpResponse('error delete')

# END BLOCK COMMENTS


# START BLOCK PICK UP AN OBJECT
def get_object_arendator(request):
    ties = Tie.objects.all()
    shows = TypeShows.objects.all()
    id_show = Shows.objects.all()
    return render(request, 'single_arendator/get_objects.html', {'ties': ties,
                                                                 'id_arendator': request.GET.get('id_arendator'),
                                                                 'shows': shows,
                                                                 'id_show': id_show})


def automat_tie_arendator(request):
    qeryset = ContactOwner.objects.all().filter(trash=False)
    search_automat(request.GET, qeryset)
    ties = Tie.objects.all()
    shows = TypeShows.objects.all()
    id_show = Shows.objects.all()
    return render(request, 'single_arendator/get_objects.html', {'ties': ties,
                                                                 'id_arendator': request.GET.get('id_arendator'),
                                                                 'shows': shows,
                                                                 'id_show': id_show})


def add_id_cont_owner(request):
    if ContactOwner.objects.filter(id=request.GET.get('id_cont_owner')).exists():
        cont_owner = ContactOwner.objects.get(id=request.GET.get('id_cont_owner'))
        if cont_owner.trash:
            return HttpResponse(status=404, content=b'Обект в корзине')
    else:
        return HttpResponse(status=404, content=b'Обекта не существует')
    arendator = Arendator.objects.get(id=request.GET.get('id_arendator'))
    tie, created = Tie.objects.get_or_create(tie_cont_owner=cont_owner)
    if not Tie.objects.filter(tie_arenda=arendator, tie_cont_owner=cont_owner).exists():
        tie.tie_arenda.add(arendator)
    else:
        return HttpResponse(status=404, content=b'Обект уже в списке')
    ties = Tie.objects.all()
    shows = TypeShows.objects.all()
    id_show = Shows.objects.all()
    return render(request, 'single_arendator/get_objects.html', {'ties': ties,
                                                                 'id_arendator': request.GET.get('id_arendator'),
                                                                 'shows': shows,
                                                                 'id_show': id_show})


def clear_cont_owner(request):
    if request.method == 'POST':
        try:
            tie_c = Tie.objects.filter(tie_arenda=request.POST.get('id_arendator'))
            for t in tie_c:
                t.tie_arenda.clear()
        except Tie.DoesNotExist:
            pass
        ties = Tie.objects.all()
        shows = TypeShows.objects.all()
        id_show = Shows.objects.all()
        return render(request, 'single_arendator/get_objects.html', {'ties': ties,
                                                                     'id_arendator': request.POST.get('id_arendator'),
                                                                     'shows': shows,
                                                                     'id_show': id_show})


def del_cont_owner(request):
    if request.method == 'POST':
        tie = Tie.objects.get(tie_cont_owner=request.POST.get('id_cont_owner'))
        arend = tie.tie_arenda.get(id=request.POST.get('id_arendator'))
        tie.tie_arenda.remove(arend)
        ties = Tie.objects.all()
        shows = TypeShows.objects.all()
        id_show = Shows.objects.all()
        print(ties)
        return render(request, 'single_arendator/get_objects.html', {'ties': ties,
                                                                     'id_arendator': request.POST.get('id_arendator'),
                                                                     'shows': shows,
                                                                     'id_show': id_show})


def change_show_owner(request):
    if request.method == 'POST':
        try:
            cont_owner = ContactOwner.objects.get(id=request.POST.get('id_cont_owner'))
            arendator = Arendator.objects.get(id=request.POST.get('id_arendator'))
            show = TypeShows.objects.get(id=request.POST.get('show'))
            new_show, created = Shows.objects.get_or_create(array_arendator=arendator, array_cont_ower=cont_owner)
            new_show.type_shows_arendator = show
            new_show.save()
            return HttpResponse(content=b'Изменено')
        except:
            return HttpResponse(status=500)

# END BLOCK PICK UP AN OBJECT
