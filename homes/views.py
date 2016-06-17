from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def views(request):
    return render(request, 'homes/index.html', {})

def object(request):
    return render(request, 'homes/object.html', {})
