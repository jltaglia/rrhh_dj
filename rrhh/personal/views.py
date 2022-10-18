from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import (ListView,
                                  TemplateView,
                                  CreateView,
                                  UpdateView,
                                  DetailView,
                                  DeleteView)
from .models import Personal

# Create your views here.

class Lista_Empleado(ListView):
    queryset = Personal.objects.order_by('apellidos', 'nombres')
    template_name = 'personal/personal_index.html' 


class Ingreso_Filtro_Empleado(TemplateView):
    model = Personal
    template_name = 'personal/personal_filter.html'
    
    def get_queryset(self): 
        return Personal.objects.order_by('apellidos', 'nombres')


class Filtra_Empleado(ListView):
    model = Personal
    template_name = 'personal/personal_index.html' 

    def get_queryset(self):
        p_apellidos = self.kwargs.get('apellidos')
        p_nombres = self.kwargs.get('nombres')
        
        if p_nombres != '' and p_apellidos != '':
            return Personal.objects.filter(apellidos__contains=p_apellidos.upper(), nombres__contains=p_nombres.upper()).order_by('apellidos', 'nombres')
        elif p_apellidos != '':
            return Personal.objects.filter(apellidos__contains=p_apellidos.upper()).order_by('apellidos', 'nombres')
        elif p_nombres != '':
            return Personal.objects.filter(nombres__contains=p_nombres.upper()).order_by('apellidos', 'nombres')
        else:
            return Personal.objects.order_by('apellidos', 'nombres')
        
    
class Nuevo_Empleado(CreateView):
    model = Personal
    template_name = 'personal/personal_create_form.html'
    fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]

class Edita_Empleado(UpdateView):
    model = Personal
    template_name = 'personal/personal_form.html' 
    fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]
    success_url = '/personal/'


class Detalle_Empleado(DetailView):
    model = Personal
    template_name = 'personal/personal_detail.html'
    fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]

class Baja_Empleado(DeleteView):
    model = Personal
    template_name = 'personal/personal_confirm_delete.html' 
    success_url = '/personal/'
    