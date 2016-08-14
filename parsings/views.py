from django.shortcuts import render

# Create your views here.


def services(request):
    return render(request, 'parsings/services.html', {})

def parser_olx(request):
    return render(request, 'parsings/parser_olx.html', {})
