from django.contrib import admin
from .models import Personal

# Register your models here.

class PersonalAdmin(admin.ModelAdmin):
     fields = ('foto',('apellidos', 'nombres'),
               ('id_documento', 'documento'),
               ('cuil','fecha_nacimiento', 'id_est_civil'),
               ('fecha_ingreso', 'id_categoria'),
               ('domicilio','id_localidad','id_provincia'),
               ('tel','email'))

     exclude = ('fecha_egreso',
               'saldo_licencia',
               'licencia_curso',
               'fecha_regreso')

     def get_queryset(self, request):
          queryset = (super(PersonalAdmin, self).
                              get_queryset(request).
                              order_by('apellidos', 'nombres'))
          return queryset


admin.site.register(Personal, PersonalAdmin)
