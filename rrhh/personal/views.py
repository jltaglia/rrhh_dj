from django.http import HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.views import generic
from .models import Personal

# Create your views here.

class Lista_Empleado(generic.ListView):
    queryset = Personal.objects.order_by('apellidos', 'nombres')
    template_name = 'personal/personal_index.html' 


class Ingreso_Filtro_Empleado(generic.TemplateView):
    # queryset = Personal.objects.order_by('apellidos', 'nombres').filter(apellidos='TAGLIARINI')
    template_name = 'personal/personal_filter.html' 


class Filtra_Empleado(generic.TemplateView):
    # queryset = Personal.objects.order_by('apellidos', 'nombres').filter(apellidos='TAGLIARINI')
    template_name = 'personal/personal_index.html' 
    
    def get_queryset(self):
        self.apellidos = get_object_or_404(Personal, apellidos=self.kwargs['apellidos'])
        self.nombres = get_object_or_404(Personal, nombres=self.kwargs['nombres'])
        return Personal.objects.filter(apellidos=self.apellidos, nombres=self.nombres).order_by('apellidos', 'nombres')
    

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
    