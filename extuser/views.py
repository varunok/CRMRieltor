# -*- coding: utf-8 -*-


from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.contrib.auth import login, logout, authenticate
from django.views.generic.edit import FormView
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.utils import timezone, dateformat
from django.contrib.auth.models import User
from extuser.models import UsersGroupExtUser, MyUser, RecoveryPass
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.conf import settings
from setting_mail_delivery.models import TemplateEmail, TemplateSms, SettingSMS, SettingEmail

EMAIL_HOST_USER = settings.EMAIL_HOST_USER

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
                return HttpResponseRedirect('/')


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
    return render(request, 'extuser/register.html', {'time': timezone.now(), 'type_user': type_user})


@login_required
def add_user(request):
    if request.method == 'POST':
        if request.POST.get('add_user') is not None:
            if request.user.is_superuser:
                result = request.POST
                print(result)
                new_user = User.objects.create_user(last_login=timezone.now(), username=result.get('email'), first_name=result.get('first_name'), last_name=result.get('last_name'), email=result.get('email'), password=result.get('password'))
                new_user.save()
                add_img = MyUser(image=request.FILES['photo'], user_id=new_user.id, type_user_id=result.get('type_user'))
                add_img.save()
                recovery = RecoveryPass(email=result.get('email'), password=result.get('password'))
                recovery.save()
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


def send_recavery_pass(request):
    if request.method == 'POST':
        temp_email = get_object_or_404(TemplateEmail, pk=1)
        email_from = is_sender_address_valid(temp_email.sender_address)
        # if request.POST.get('restore_btn') is not None:
        if True:
            emails = RecoveryPass.objects.filter(email=request.POST.get('restore_pass'))
            if emails:
                for email in emails:
                    sending = send_mail("Востановление пароля", email.password, email_from, [email.email], fail_silently=False)
                    if sending:
                        return HttpResponse(content=b'Пароль вислан на Вашу почту')
    return HttpResponse(content=b'Ошибка отсилки')


def is_sender_address_valid(sender_address):
    rieltor_email_setting = get_object_or_404(SettingEmail, id=1)
    EMAIL_HOST_USER = str(rieltor_email_setting.host_user)
    sender_address_is_valid = sender_address.split('@')[-1]
    email_host_is_valid = EMAIL_HOST_USER.split('@')[-1]
    if sender_address_is_valid != email_host_is_valid:
        return EMAIL_HOST_USER
    return sender_address
