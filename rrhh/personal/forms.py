from django import forms
from django.forms import ModelForm
from .models import Personal


class PersonalForm(ModelForm):
    class Meta:
        localize = True
        model = Personal
        exclude = ['fecha_egreso', 'saldo_licencia', 'licencia_curso', 'fecha_regreso']
        widgets = {
            'fecha_nacimiento': forms.DateInput(format = '%Y-%m-%d', attrs={'type':'date'}),
            'fecha_ingreso': forms.DateInput(format = '%Y-%m-%d', attrs={'type':'date'}),
        }
