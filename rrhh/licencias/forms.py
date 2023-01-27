from django import forms
from django.forms import ModelForm
from .models import Legajos

import datetime as dt


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
