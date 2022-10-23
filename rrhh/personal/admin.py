from django.contrib import admin
from .models import Personal

# Register your models here.

class PersonalAdmin(admin.ModelAdmin):
     readonly_fields = ('fecha_egreso',
                        'saldo_licencia',
                        'licencia_curso',
                        'fecha_regreso')


admin.site.register(Personal, PersonalAdmin)
