from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.views.generic import (ListView,
                                  TemplateView,
                                  CreateView,
                                  UpdateView,
                                  DetailView,
                                  DeleteView)
from .models import Personal
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import PersonalForm

# Create your views here.

class Lista_Empleado(ListView):
    queryset = Personal.objects.order_by('apellidos', 'nombres')
    template_name = 'personal/personal_index.html'


class Ingreso_Filtro_Empleado(TemplateView):
    model = Personal
    fields = ['apellidos', 'nombres']
    template_name = 'personal/personal_filter.html'
    
    def get_queryset(self): 
        return Personal.objects.order_by('apellidos', 'nombres')


class Filtra_Empleado(ListView):
    model = Personal
    template_name = 'personal/personal_index.html' 
    
    def get_queryset(self):

        apellidos = self.request.GET.get("apellidos", None)
        nombres = self.request.GET.get("nombres", None)
     
        if nombres != '' and apellidos != '':
            return (Personal.objects.
                        filter(apellidos__contains=apellidos.upper(), 
                               nombres__contains=nombres.upper()).
                        order_by('apellidos', 'nombres')) 
        elif apellidos != '':
            return (Personal.objects.
                        filter(apellidos__contains=apellidos.upper()).
                        order_by('apellidos', 'nombres'))
        elif nombres != '':
            return (Personal.objects.
                        filter(nombres__contains=nombres.upper()).
                        order_by('apellidos', 'nombres'))
        else:
            return (Personal.objects.
                        order_by('apellidos', 'nombres'))

    
class Nuevo_Empleado(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Personal
    template_name = 'personal/personal_create_form.html'
    form_class = PersonalForm
    success_message = "El empleado ha sido dado de alta con exito!"
    success_url = reverse_lazy('personal:personal-index')


class Edita_Empleado(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Personal
    template_name = 'personal/personal_form.html' 
    form_class = PersonalForm
    success_message = "Los datos del empleado han sido modificados con exito!"
    success_url = reverse_lazy('personal:personal-index')


class Detalle_Empleado(DetailView):
    model = Personal
    template_name = 'personal/personal_detail.html'


class Baja_Empleado(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = Personal
    template_name = 'personal/personal_confirm_delete.html' 
    success_message = "El empleado han sido dado de baja!"
    success_url = reverse_lazy('personal:personal-index')
    