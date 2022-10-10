from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
    )

from .models import Personal
from .forms import Nuevo_empleado

# Create your views here.

def index(request):
    # return HttpResponse('Index de Personal')
    empleados = Personal.objects.order_by('apellidos', 'nombres')
    context = {'empleados': empleados}
    return render(request, 'personal/index.html', context)


def filter(request):
    return HttpResponse('Filter de Personal')
    
def create(request):
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = Nuevo_empleado(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            form.save()
            messages.success(request, f'Empleado dado de alta!') # flash message
            return redirect('index')

    # if a GET (or any other method) we'll create a blank form
    else:
        form = Nuevo_empleado()

    return render(request, 'personal/create.html', {'form': form})
        

class Detalle_Empleado(DetailView):
    model = Personal      

    