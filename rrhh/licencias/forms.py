from django import forms
from django.forms import ModelForm
from .models import Legajos
import datetime as dt

from .services import busca_evento_anterior
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


class LegajosForm(ModelForm):
    
    class Meta:
        localize = True
        model = Legajos
        fields = ['id_empleado', 'fecha_desde', 'fecha_hasta', 'id_evento', 'cantidad', 'borrable', 'afecta_vac']
        widgets = {
            'fecha_desde': forms.DateInput(format = '%Y-%m-%d', attrs={'type':'date'}),
            'fecha_hasta': forms.DateInput(format = '%Y-%m-%d', attrs={'type':'date'}),
            'id_evento': forms.Select()
        }


    # PARA VALIDAR QUE LAS FECHAS INGRESADAS NO SE SUPERPONGAN 
    # CON UN EVENTO ANTERIORMENTE INGRESADO.
    def clean(self):
        cleaned_data = super().clean()
        fecha_desde = cleaned_data.get("fecha_desde")
        fecha_hasta = cleaned_data.get("fecha_hasta")
        nombre_empleado = cleaned_data.get("id_empleado")
        # PORQUE ACA id_empleado POR ESTAR RELACIONADO CON LA TABLA Personal
        # ME DEVUELVE EL NOMBRE DEL EMPLEADO Y NO EL ID NUEMRICO, TENGO QUE 
        # EXTRAER DEL FORMULARIO CON ESTA LINEA DE ABAJO EL NUMERO DE EMPLEADO
        # (ID NUMÉRICO)
        id_empleado = self.data['txtIdEmpleado']


        if fecha_desde and fecha_hasta:
            # Only do something if both fields are valid so far.
            evento_ant = busca_evento_anterior(id_empleado) 
            
            
            print('evento anterior')
            print('\n', evento_ant.fecha_desde, evento_ant.fecha_hasta, evento_ant.cantidad)
            print('id_empleado', id_empleado)
            print('nombre_empleado', nombre_empleado)
            input()

            if evento_ant:
                if fecha_hasta <= evento_ant.fecha_hasta:
                    raise ValidationError(_('Fecha incorrecta, la fecha no puede ser anterior al día de finalización del último evento registrado a la fecha!'), code='invalid')

    