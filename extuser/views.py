# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import login, logout, authenticate
from django.http import HttpResponseRedirect
from django.views.generic.edit import FormView
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.utils import timezone, dateformat
from django.contrib.auth.models import User
from extuser.models import UsersGroupExtUser
from extuser.models import MyUser
from django.contrib.auth.decorators import login_required



# Create your views here.
class LoginFormView(FormView):
    form_class = AuthenticationForm
    template_name = "extuser/log_in.html"
    success_url = "/"

def login_user(request):
    if request.method == 'POST':
        if request.POST.get('login') is not None:
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None and user.is_active:
                login(request, user)
                return HttpResponseRedirect('/')
            else:
                return HttpResponseRedirect("/")

@login_required
def logout_user(request):
    if request.method == 'GET':
        logout(request)
        return HttpResponseRedirect("accounts/login/")


@login_required
class RegisterFormView(FormView):
    form_class = UserCreationForm
    # Ссылка, на которую будет перенаправляться пользователь в случае успешной регистрации.
    # В данном случае указана ссылка на страницу входа для зарегистрированных пользователей.
    success_url = "/"
    # Шаблон, который будет использоваться при отображении представления.
    template_name = "extuser/register.html"
    def form_valid(self, form):
        # Создаём пользователя, если данные в форму были введены корректно.
        form.save()
        # Вызываем метод базового класса
        return super(RegisterFormView, self).form_valid(form)


@login_required
def register(request):
    type_user = UsersGroupExtUser.objects.all()
    return render(request, 'extuser/register.html', { 'time': timezone.now(), 'type_user': type_user})


@login_required
def add_user(request):
    if request.method == 'POST':
        if request.POST.get('add_user') is not None:
            if request.user.is_superuser:
                result = request.POST
                print(result)
                new_user = User.objects.create_user(username=result.get('email'), first_name=result.get('first_name'), last_name=result.get('last_name'), email=result.get('email'), password=result.get('password'))
                new_user.save()
                add_img = MyUser(image=request.FILES['photo'], user_id=new_user.id, type_user_id=result.get('type_user'))
                add_img.save()
                return user_list(request)


@login_required
def user_list(request):
    exuser = User.objects.all()
    return render(request, 'extuser/setting_user.html', { 'time': timezone.now(), "exuser": exuser})


@login_required
def delete_user(request):
    if request.user.is_superuser:
        results = request.GET
        result = results.get('id_user')
        inactive_user = User.objects.get(id=int(result))
        inactive_user.is_active = 0
        inactive_user.save()
        exuser = User.objects.all().filter(is_active=1)
        json = JsonResponse({"del":True, "count_user":len(exuser)})
        return HttpResponse(json)
    else:
        return HttpResponse(JsonResponse({"del":False}))