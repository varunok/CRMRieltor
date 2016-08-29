# -*- coding: utf-8 -*-


# Create your views here.
from django.shortcuts import render
from django.utils import timezone, dateformat
from datetime import datetime
from django.http import HttpResponse,  JsonResponse
from django.views.generic import DetailView, ListView
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib.auth.models import User

from facility.models import ContactOwner, ImagesFacility, NationalCarrency, TypeActuality
from single_object.models import SingleObjComments, Tie, TypeShows, ShowsArendator, TieBuyer, ShowsBuyer
from extuser.models import MyUser
from arendator.models import Arendator
from buyer.models import Buyer
from search_automat_arendator import search_automat
from tasking.forms import TaskingForm
from tasking.models import UserFullName, Tasking
from homes.views import TaskingList, TaskingListArchive


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
        self.context['single_obj_comments'] = SingleObjComments.objects.filter(obj_comments=self.context['single_object'].id, type_tabs='comments')
        try:
            self.context['count_arendator'] = Tie.objects.get(tie_cont_owner=self.context['single_object'].id).tie_arenda.all().count()
        except:
            self.context['count_arendator'] = 0
        try:
            self.context['count_buyer'] = TieBuyer.objects.get(tie_cont_owner=self.context['single_object'].id).tie_buye.all().count()
        except:
            self.context['count_buyer'] = 0
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

# START BLOCK COMMENTS
def get_comment(request):
    data_comment = SingleObjComments.objects.filter(obj_comments=request.GET['id_so']).order_by('-date_comment')
    return render(request, 'single_object/comments.html', {"single_obj_comments": data_comment})

def add_obj_comment(request):
    author = User.objects.get(id=request.POST['id_user'])
    author_name = author.get_full_name()
    singl_obj = ContactOwner.objects.get(id=request.POST['id_single_obj'])
    image = MyUser.objects.get(user=author)
    comment = SingleObjComments(obj_comments=singl_obj,
                                comment=unicode(request.POST['text_comment']),
                                author_comment=unicode(author_name),
                                image=unicode(image.image),
                                type_tabs=request.POST['type_tabs'])
    comment.save()
    comments = SingleObjComments.objects.filter(obj_comments=singl_obj).last()
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
        SingleObjComments.objects.get(id=id_comment).delete()
        return HttpResponse('comment delete')
    else:
        return HttpResponse('error delete')
# END BLOCK COMMENTS

# START BLOCK ARENDATOR
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


class AutomatTie(ListView):
    model = Arendator
    context_object_name = 'arendators'
    template_name = 'single_object/return_table/list_table.html'
    qeryset = Arendator.objects.all().filter(trash=False)

    def get_context_data(self, **kwargs):
        self.context = super(AutomatTie, self).get_context_data(**kwargs)
        self.context['type_shows'] = TypeShows.objects.all()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['show_arendators'] = ShowsArendator.objects.all()
        self.context['error'] = True
        return self.context


    def get_queryset(self):
        return search_automat(self.request.GET, self.qeryset)

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(AutomatTie, self).dispatch(request, *args, **kwargs)


def get_arendator(request):
    ties = Tie.objects.all()
    singl_obg = ContactOwner.objects.get(id=request.GET.get('id_so'))
    try:
        count_arendator = Tie.objects.get(tie_cont_owner=singl_obg).tie_arenda.all().count()
    except:
        count_arendator = 0
    type_shows = TypeShows.objects.all()
    nac_carrency = NationalCarrency.objects.get(id=1)
    shows = ShowsArendator.objects.all()
    data_comment = SingleObjComments.objects.filter(obj_comments=request.GET['id_so']).order_by('-date_comment')
    return render(request, 'single_object/arendator.html', {"ties": ties,
                                                            "singl_obj": singl_obg,
                                                            "display": True,
                                                            "error": True,
                                                            "type_shows": type_shows,
                                                            "nac_carrency": nac_carrency,
                                                            "shows_arendator": shows,
                                                            "count_arendator": count_arendator,
                                                            "single_obj_comments": data_comment})


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


def delete_tie_arendator(request, did):
    try:
        tie = Tie.objects.get(tie_cont_owner=request.POST.get('id'))
        arend = tie.tie_arenda.get(id=did)
        tie.tie_arenda.remove(arend)
        if tie.tie_arenda.filter(id=did):
            return HttpResponse(status=404)
        return HttpResponse(status=200)
    except:
        return HttpResponse(status=404)


def clear_all_arendator(request):
    try:
        tie = Tie.objects.get(tie_cont_owner=request.POST.get('id'))
        tie.tie_arenda.clear()
        return HttpResponse(status=200)
    except:
        return HttpResponse(status=404)
# END BLOCK ARENDATOR

# START BLOCK BUYER
class AddBuyerToTie(DetailView):
    model = Buyer
    slug_url_kwarg = 'idu'
    slug_field = 'id'
    template_name = 'single_object/return_table/single_table_buyer.html'
    context_object_name = 'buyer'

    def get_context_data(self, **kwargs):
        self.context = super(AddBuyerToTie, self).get_context_data(**kwargs)
        self.context['type_shows'] = TypeShows.objects.all()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['show_arendators'] = ShowsBuyer.objects.all()
        self.context['error'] = True
        return self.context

    def get(self, request, *args, **kwargs):
        if Buyer.objects.filter(id=self.kwargs['idu'], trash=False).exists():
            buyer = Buyer.objects.get(id=self.kwargs['idu'], trash=False)
        else:
            return HttpResponse(status=404)
        cont_owner = ContactOwner.objects.get(id=self.request.GET.get('id'))
        # self.context['count_arendator'] = Tie.objects.get(tie_cont_owner=cont_owner).tie_arenda.all().count()
        tie_buyer, created = TieBuyer.objects.get_or_create(tie_cont_owner=cont_owner)
        if TieBuyer.objects.filter(tie_buye=buyer, tie_cont_owner=cont_owner).exists() == False:
            tie_buyer.tie_buye.add(buyer)
        else:
            return HttpResponse(status=404)
        self.object = self.get_object()
        context = self.get_context_data(object=self.object)
        return self.render_to_response(context)


class AutomatTieBuyer(ListView):
    model = Buyer
    context_object_name = 'buyers'
    template_name = 'single_object/return_table/list_table_buyer.html'
    qeryset = Buyer.objects.all().filter(trash=False)

    def get_context_data(self, **kwargs):
        self.context = super(AutomatTieBuyer, self).get_context_data(**kwargs)
        self.context['type_shows'] = TypeShows.objects.all()
        self.context['nac_carrency'] = NationalCarrency.objects.get(id=1)
        self.context['show_arendators'] = ShowsBuyer.objects.all()
        self.context['error'] = True
        return self.context


    def get_queryset(self):
        return search_automat(self.request.GET, self.qeryset)

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(AutomatTieBuyer, self).dispatch(request, *args, **kwargs)


def get_buyer(request):
    ties = TieBuyer.objects.all()
    singl_obg = ContactOwner.objects.get(id=request.GET.get('id_so'))
    try:
        count_buyers = TieBuyer.objects.get(tie_cont_owner=singl_obg).tie_buye.all().count()
    except:
        count_buyers = 0
    type_shows = TypeShows.objects.all()
    nac_carrency = NationalCarrency.objects.get(id=1)
    shows = ShowsBuyer.objects.all()
    data_comment = SingleObjComments.objects.filter(obj_comments=request.GET['id_so']).order_by('-date_comment')
    return render(request, 'single_object/buyers.html', {"ties": ties,
                                                            "singl_obj": singl_obg,
                                                            "display": True,
                                                            "error": True,
                                                            "type_shows": type_shows,
                                                            "nac_carrency": nac_carrency,
                                                            "shows_buyer": shows,
                                                            "count_buyer": count_buyers,
                                                            "single_obj_comments": data_comment})


def change_shows_buyer(request, id_a):
    try:
        id_a, id_o, id_show = id_a.split('=')
        id_a = id_a.split('-')[-1]
        id_o = id_o.split('-')[-1]
        id_show = id_show.split('-')[-1]
        type_shows = TypeShows.objects.get(id=id_show)
        buyer = Buyer.objects.get(id=id_a)
        cont_owner = ContactOwner.objects.get(id=id_o)
        show_ar, created = ShowsBuyer.objects.get_or_create(array_buyer=buyer, array_cont_ower=cont_owner)
        show_ar.type_shows_buyer = type_shows
        show_ar.save()
        return HttpResponse('ok')
    except:
        return HttpResponse('error')


def delete_tie_buyer(request, did):
    try:
        tie = TieBuyer.objects.get(tie_cont_owner=request.POST.get('id'))
        buyers = tie.tie_buye.get(id=did)
        tie.tie_buye.remove(buyers)
        if tie.tie_buye.filter(id=did):
            return HttpResponse(status=404)
        return HttpResponse(status=200)
    except:
        return HttpResponse(status=404)


def clear_all_buyer(request):
    try:
        tie = TieBuyer.objects.get(tie_cont_owner=request.POST.get('id'))
        tie.tie_buye.clear()
        return HttpResponse(status=200)
    except:
        return HttpResponse(status=404)
# END BLOCK BUYER

#START BLOCK TASKING
def get_form_task(request, form=TaskingForm()):
    form.fields['task_facility'].queryset = ContactOwner.objects.filter(trash=False)
    form.fields['task_arendator'].queryset = Arendator.objects.filter(trash=False)
    form.fields['task_buyer'].queryset = Buyer.objects.filter(trash=False)
    form.fields['rieltor'].queryset = UserFullName.objects.filter(is_active=True)
    form.fields['access'].queryset = UserFullName.objects.filter(is_active=True)
    if form.errors:
        return render(request, 'single_object/single_tasking/form.html', {"form": form}, status=500)

    return render(request, 'single_object/single_tasking/form.html', {"form": form})

def save_form_tasking_task(request):
    if request.method == 'POST':
       form = TaskingForm(request.POST)
       if form.is_valid():
           form.save()
           task = Tasking.objects.last()
           return single_task(request, task)
       else:
           form = TaskingForm(request.POST)
           return get_form_task(request, form)

def single_task(request, task):
    return render(request, 'tasking/single_task.html', {"tasking": task})


class TaskingSingleList(TaskingList):
    template_name = 'single_object/tasks.html'
    queryset = Tasking.objects.filter(task_trash=False, task_archiv=False)

    def get_queryset(self):
        self.queryset = self.queryset.filter(task_facility=self.request.GET.get('id_so'))
        return self.queryset
#END BLOCK TASKING


def get_publication(request):
    return render(request, 'single_object/publication.html', {})


def get_meetings(request):
    return render(request, 'single_object/meetings.html', {})


# def get_tasks(request):
#     return render(request, 'single_object/tasks.html', {})





class DatabasesPrevious(SingleObjectView):
    slug_url_kwarg = 'poid'
    slug_field = 'id'
    template_name = 'single_object/previous.html'


