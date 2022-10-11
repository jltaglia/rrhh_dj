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
        # SI EL REQUEST ES UN POST:
        form = Nuevo_empleado(request.POST)
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            form.save()
            messages.success(request, f'Empleado dado de alta!') # flash message
            return redirect('index')

    # SI EL REQUEST ES UN GET:
    else:
        form = Nuevo_empleado()

    return render(request, 'personal/create.html', {'form': form})
        

class Detalle_Empleado(DetailView):
    model = Personal      

class Baja_Empleado(DeleteView):
    model = Personal
    success_url = '/'
    