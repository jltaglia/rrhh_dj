from django.http import HttpResponse
from django.shortcuts import render

from .models import Personal

# Create your views here.

def index(request):
    # return HttpResponse('Index de Personal')
    empleados = Personal.objects.order_by('apellidos', 'nombres')
    context = {'empleados': empleados}
    return render(request, 'personal/index.html', context)


def filter(request):
    return HttpResponse('Filter de Personal')
    
def create(request):
    return HttpResponse('Create de Personal')
    