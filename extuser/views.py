# -*- coding: utf-8 -*-


from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import login
from django.views.generic.edit import FormView
from django.contrib.auth.forms import AuthenticationForm
from django.http import HttpResponseRedirect
from django.views.generic.base import View
from django.contrib.auth import logout
from django.views.generic.edit import FormView
from django.contrib.auth.forms import UserCreationForm
from django.utils import timezone, dateformat
from django.contrib.auth.models import User
from extuser.models import UsersGroupExtUser
from extuser.models import MyUser



# Create your views here.
class LoginFormView(FormView):
    form_class = AuthenticationForm
    template_name = "extuser/log_in.html"
    success_url = "/"

    def form_valid(self, form):
        # Получаем объект пользователя на основе введённых в форму данных.
        self.user = form.get_user()
        # Выполняем аутентификацию пользователя.
        login(self.request, self.user)
        return super(LoginFormView, self).form_valid(form)


class LogoutView(View):
    def get(self, request):
        # Выполняем выход для пользователя, запросившего данное представление.
        logout(request)
        # После чего, перенаправляем пользователя на главную страницу.
        return HttpResponseRedirect("accounts/login/")


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


def register(request):
    type_user = UsersGroupExtUser.objects.all()
    return render(request, 'extuser/register.html', { 'time': timezone.now(), 'type_user': type_user})


def add_user(request):
    if request.method == 'POST':
        if request.POST.get('add_user') is not None:
            result = request.POST
            print(result)
            new_user = User(username=result.get('email'), first_name=result.get('first_name'), last_name=result.get('last_name'), email=result.get('email'), password=result.get('password'))
            new_user.set_password(result.get('password'))
            new_user.save()
            add_img = MyUser(image=request.FILES['photo'], user_id=new_user.id, type_user_id=result.get('type_user'))
            add_img.save()
            print()
            return user_list(request)


def user_list(request):
    exuser = User.objects.all()
    return render(request, 'extuser/setting_user.html', { 'time': timezone.now(), "exuser": exuser})


def delete_user(request):
    results = request.GET
    result = results.get('id_user')
    MyUser.objects.filter(user_id=int(result)).delete()
    User.objects.filter(id=int(result)).delete()
    return HttpResponse("object delete")