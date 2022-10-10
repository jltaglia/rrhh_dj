from django import forms
from .models import Personal


class Nuevo_empleado(forms.ModelForm):
   
    class Meta:
        model = Personal
        fields = ['foto', 'apellidos', 'nombres', 'id_documento',
                    'documento','cuil','fecha_nacimiento','fecha_ingreso',
                    'id_categoria', 'id_est_civil', 'domicilio',
                    'id_localidad', 'id_provincia', 'tel', 'email'
                    ]
