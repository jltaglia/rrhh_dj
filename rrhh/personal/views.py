from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from django.views import generic
# 

from .models import Personal

# Create your views here.

# def index(request):
#     # return HttpResponse('Index de Personal')
#     empleados = Personal.objects.order_by('apellidos', 'nombres')
#     context = {'empleados': empleados}
#     return render(request, 'personal/index.html', context)

class Filtra_Empleado(generic.TemplateView):
    model = Personal
    template_name = 'personal/personal_form.html' 


class Lista_Empleado(generic.ListView):
    model = Personal
    template_name = 'personal/personal_index.html' 
    

class Nuevo_Empleado(generic.CreateView):
    model = Personal
    template_name = 'personal/personal_create_form.html'
    fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]

class Edita_Empleado(generic.UpdateView):
    model = Personal
    template_name = 'personal/personal_form.html' 
    fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]
    success_url = '/personal/'


class Detalle_Empleado(generic.DetailView):
    model = Personal
    template_name = 'personal/personal_detail.html'

class Baja_Empleado(generic.DeleteView):
    model = Personal
    template_name = 'personal/personal_confirm_delete.html' 
    success_url = '/personal/'
    