# -*- coding: utf-8 -*-


from django.shortcuts import render
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
        result = request.POST
        print(result)
        us = User(first_name=result.get('first_name'), last_name=result.get('last_name'), email=result.get('email'), password=result.get('password'))
        return user_list(request)


def user_list(request):
    exuser = User.objects.all()
    return render(request, 'extuser/setting_user.html', { 'time': timezone.now(), "exuser": exuser})
