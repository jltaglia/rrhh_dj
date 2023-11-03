from django.db import models
from PIL import Image
from datetime import date
import personal.validators as va
import os
import datetime

# Create your models here.
class Categorias (models.Model):
    descripcion = models.CharField(max_length=20)
    
    def __str__(self):
        return self.descripcion


class Est_civil (models.Model):
    descripcion = models.CharField(max_length=15)
    
    def __str__(self):
        return self.descripcion

class Eventos (models.Model):
    descripcion = models.CharField(max_length=20)
    prt_planilla = models.BooleanField(default=True)

    def __str__(self):
        return self.descripcion


class Tipo_doc (models.Model):
    descripcion = models.CharField(max_length=10)

    def __str__(self):
        return self.descripcion


class Provincias (models.Model):
    nombre = models.CharField(max_length=31)

    def __str__(self):
        return self.nombre


class Localidades (models.Model):
    nombre = models.CharField(max_length=60)
    cp_localidad = models.IntegerField()
    id_provincia = models.ForeignKey(Provincias, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.nombre


class Parentescos (models.Model):
    descripcion = models.CharField(max_length=10)

    def __str__(self):
        return self.descripcion

#Modifico el campo charfield para que siempre esté en mayusculas (para los campos de Nombres y Apellidos)    
class NameField(models.CharField):
    def __init__(self, *args, **kwargs):
        super(NameField, self).__init__(*args, **kwargs)

    def get_prep_value(self, value):
        return str(value).upper()


class Personal (models.Model):
    foto             = models.ImageField(default='default.jpg', upload_to='fotos_pers', verbose_name='Foto Personal')
    apellidos        = NameField(max_length=30, verbose_name='Apellidos')
    nombres          = NameField(max_length=40, verbose_name='Nombres')
    id_documento     = models.ForeignKey(Tipo_doc, on_delete=models.PROTECT, verbose_name='Tipo Documento')
    documento        = models.CharField(max_length=8, verbose_name='Num. Documento', validators=[va.validate_dni])
    cuil             = models.CharField(max_length=11, verbose_name='CUIL',  validators=[va.validate_cuil])
    fecha_nacimiento = models.DateField(verbose_name='Fecha de Nacimiento', validators=[va.validate_fecha_nacimiento])
    fecha_ingreso    = models.DateField(verbose_name='Fecha de Ingreso', validators=[va.validate_fecha_ingreso])
    fecha_egreso     = models.DateField(null=True, blank=True, verbose_name='Fecha de Egreso')
    id_categoria     = models.ForeignKey(Categorias, on_delete=models.PROTECT, verbose_name='Categoria')
    id_est_civil     = models.ForeignKey(Est_civil, on_delete=models.PROTECT, verbose_name='Estado Civil')
    domicilio        = models.CharField(max_length=50, verbose_name='Domicilio')
    id_localidad     = models.ForeignKey(Localidades, on_delete=models.PROTECT, verbose_name='Localidad')
    id_provincia     = models.ForeignKey(Provincias, on_delete=models.PROTECT, verbose_name='Provincia')
    tel              = models.CharField(max_length=15, verbose_name='Teléfono')
    email            = models.EmailField(null=True, blank=True, verbose_name='Email')
    # default = 14 significa que cuando se da de alta el empleado le corresponden 14 días de vacaciones
    saldo_licencia   = models.SmallIntegerField(verbose_name='Saldo de Licencia', default = 14)
    # La licencia en curso se inicia en el año en que se da de alta el empleado
    licencia_curso   = models.SmallIntegerField(verbose_name='Licencia en Curso', default = int(date.today().strftime("%Y")))
    fecha_regreso    = models.DateField(null=True, blank=True, verbose_name='Fecha de Regreso')
        
    class Meta:
        verbose_name = 'personal'
        verbose_name_plural = 'Personal'

    def __init__(self, *args, **kwargs):
        super(Personal, self).__init__(*args, **kwargs)
        self.foto_old_name = self.foto.name
        
    def __str__(self):
        return self.apellidos.upper() + ', ' + self.nombres
   
    def save(self, *args, **kwargs ):
        # SE SOBREESCRIBE EL METODO SAVE()...

        if self.foto.name != self.foto_old_name:
        # SI LA FOTO CAMBIA (POR ALTA O MODIFICACION)

            # ...PARA CAMBIAR EL NOMBRE DEL ARCHIVO
            # ELEGIDO PARA EL EMPLEADO Y ANONIMIZARLO
            ext_archivo = self.foto.name.split('.')[-1]        
            # self.foto.name = 'fotos_pers/' + datetime.datetime.now().strftime("%d%m%Y%H%M%S") + '.' + ext_archivo
            self.foto.name = datetime.datetime.now().strftime("%d%m%Y%H%M%S") + '.' + ext_archivo
            super().save(*args, **kwargs)
        
            # ...Y POR LAS DUDAS QUE LA FOTO ELEGIDA
            # PARA EL EMPLEADO SEA MUY GRANDE
            img = Image.open(self.foto.path)
            if img.height > 300 or img.width > 300:
                output_size = (300, 300)
                img.thumbnail(output_size)
                img.save(self.foto.path)
        
        else:
            super().save(*args, **kwargs)
            
        