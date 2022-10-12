from tabnanny import verbose
from django.db import models
from PIL import Image

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


class Personal (models.Model):
    foto             = models.ImageField(default='default.jpg', upload_to='fotos_pers', verbose_name='Foto Personal')
    legajo           = models.SmallIntegerField(verbose_name='Lejajo Num.')
    apellidos        = models.CharField(max_length=30, verbose_name='Apellidos')
    nombres          = models.CharField(max_length=40, verbose_name='Nombres')
    id_documento     = models.ForeignKey(Tipo_doc, on_delete=models.PROTECT, verbose_name='Tipo Documento')
    documento        = models.IntegerField(verbose_name='Num. Documento')
    cuil             = models.BigIntegerField(verbose_name='CUIL')
    fecha_nacimiento = models.DateField(verbose_name='Fecha de Nacimiento')
    fecha_ingreso    = models.DateField(verbose_name='Fecha de Ingreso')
    fecha_egreso     = models.DateField(null=True, blank=True, verbose_name='Fecha de Egreso')
    id_categoria     = models.ForeignKey(Categorias, on_delete=models.PROTECT, verbose_name='Categoria')
    id_est_civil     = models.ForeignKey(Est_civil, on_delete=models.PROTECT, verbose_name='Estado Civil')
    domicilio        = models.CharField(max_length=50, verbose_name='Domicilio')
    id_localidad     = models.ForeignKey(Localidades, on_delete=models.PROTECT, verbose_name='Localidad')
    id_provincia     = models.ForeignKey(Provincias, on_delete=models.PROTECT, verbose_name='Provincia')
    tel              = models.CharField(max_length=15, verbose_name='Teléfono')
    email            = models.EmailField(null=True, blank=True, verbose_name='Email')
    saldo_licencia   = models.SmallIntegerField(verbose_name='Saldo de Licencia')
    licencia_curso   = models.SmallIntegerField(verbose_name='Licencia en Curso')
    fecha_regreso    = models.DateField(null=True, blank=True, verbose_name='Fecha de Regreso')
    
    def __str__(self):
        return self.apellidos.upper() + ', ' + self.nombres

    
    # SE MODIFICA EL METODO SAVE() POR LAS DUDAS QUE
    # LA FOTO ELEGIDA PARA EL EMPLEADO SEA MUY GRANDE
    def save(self, *args, **kwargs ):
        super().save(*args, **kwargs)

        img = Image.open(self.foto.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.foto.path)
