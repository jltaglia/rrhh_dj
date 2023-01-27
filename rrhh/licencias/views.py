from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.views.generic import (ListView,
                                  TemplateView,
                                  CreateView,
                                  UpdateView,
                                  DetailView,
                                  DeleteView)
from .models import Legajos
from .forms import LegajosForm
from personal.models import Personal
from django.contrib.auth.mixins import LoginRequiredMixin
import datetime as dt

# Create your views here.

class Lista_Licencias(LoginRequiredMixin, SuccessMessageMixin, DetailView):
    model = Legajos
    template_name = 'licencias/mnu_licencias.html'
    
    def get_context_data(self, **kwargs):
        persona = self.kwargs['pk']
        context = super().get_context_data(**kwargs)
        context['personal'] = Personal.objects.get(pk=persona)
        context['licencias'] = Legajos.objects.filter(id_empleado=persona).order_by('-fecha_desde')

        return context


class Nueva_Licencia(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Legajos
    initial = {'fecha_desde': dt.date.today(),
               'fecha_hasta': dt.date.today() + dt.timedelta(days=1) 
            }
    template_name = 'licencias/ing_licencias.html'
    form_class = LegajosForm
    success_message = "El evento ha sido ingresado con exito!"
    
    # HAY QUE BUSCAR LA VUELTA PARA DEJAR DE HARCODEAR EL VALOR DE 'pk'
    # SI ESTO LOGRAMOS QUE FUNCIONE, HABRIA QUE SACAR EL def get_absolute_url(self):
    # DEL MODELO Legajos
    # success_url = reverse_lazy('licencias:licencias-listado', kwargs={'pk': 27})
          
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        persona = context['view'].kwargs['pk']
        context['personal'] = Personal.objects.get(pk=persona)
        return context
    