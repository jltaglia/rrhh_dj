from django.core.exceptions import ValidationError
from django.db import models
from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

import licencias.validators as va


# Create your models here.
class Legajos (models.Model):

    # LOS CAMPOS COMENTADOS SE UTILIZAN PARA CREAR LA TABLA POR PRIMERA VEZ
    # PARA PODER CARGARLE LOS DATOS A LA BD DESDE EL ARCHIVO CSV.
    # UNA VEZ CARGADOS LOS DATOS, CAMBIAR A LOS CAMPOS ForeignKey PARA QUE
    # EL MODELO FUNCIONE COMO CORRESPONDE CON SUS RELACIONES. 
    # 
    id_empleado = models.ForeignKey('personal.Personal',
                                    on_delete=models.CASCADE)
    # id_empleado = models.SmallIntegerField()
    # 

    fecha_desde = models.DateField(verbose_name='Fecha de Inicio', 
                                   validators=[va.validate_fecha_desde])
    fecha_hasta = models.DateField(verbose_name='Fecha de Fin', 
                                   validators=[va.validate_fecha_hasta])

    # 
    id_evento   = models.ForeignKey('personal.Eventos', 
                                    on_delete=models.PROTECT,
                                    verbose_name='Tipo de Evento')
    # id_evento   = models.SmallIntegerField()
    # 

    cantidad    = models.SmallIntegerField()
    borrable    = models.BooleanField()
    afecta_vac  = models.BooleanField()

    def clean(self):
        # CHEQUEAR QUE LA FECHA DE FINALIZACION SEA MAYOR O IGUAL QUE LA FECHA DE COMIENZO DEL EVENTO
        if self.fecha_desde >= self.fecha_hasta:
            raise ValidationError(_('Fecha incorrecta, la fecha de finalización debe ser mayor o igual a la de comienzo!'), code='invalid')


    def get_absolute_url(self):
            return reverse_lazy("licencias:licencias-listado", kwargs={"pk": self.id_empleado_id})
      
    