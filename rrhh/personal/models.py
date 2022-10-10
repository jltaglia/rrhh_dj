from django.db import models
from PIL import Image

# Create your models here.
class Categorias (models.Model):
    descripcion = models.CharField(max_length=20)
    
    def __str__(self) -> str:
        return self.descripcion


class Est_civil (models.Model):
    descripcion = models.CharField(max_length=15)
    
    def __str__(self) -> str:
        return self.descripcion


class Eventos (models.Model):
    descripcion = models.CharField(max_length=20)

    def __str__(self) -> str:
        return self.descripcion


class Tipo_doc (models.Model):
    descripcion = models.CharField(max_length=10)

    def __str__(self) -> str:
        return self.descripcion


class Provincias (models.Model):
    nombre = models.CharField(max_length=31)

    def __str__(self) -> str:
        return self.nombre


class Localidades (models.Model):
    nombre = models.CharField(max_length=60)
    cp_localidad = models.IntegerField()
    id_provincia = models.ForeignKey(Provincias, on_delete=models.CASCADE)
    
    def __str__(self) -> str:
        return self.nombre


class Parentescos (models.Model):
    descripcion = models.CharField(max_length=10)

    def __str__(self) -> str:
        return self.descripcion


class Personal (models.Model):
    foto             = models.ImageField(default='default.jpg', upload_to='fotos_pers')
    legajo           = models.SmallIntegerField()
    apellidos        = models.CharField(max_length=30)
    nombres          = models.CharField(max_length=40)
    id_documento     = models.ForeignKey(Tipo_doc, on_delete=models.PROTECT)
    documento        = models.IntegerField()
    cuil             = models.BigIntegerField()
    fecha_nacimiento = models.DateField()
    fecha_ingreso    = models.DateField()
    fecha_egreso     = models.DateField(null=True, blank=True)
    id_categoria     = models.ForeignKey(Categorias, on_delete=models.PROTECT)
    id_est_civil     = models.ForeignKey(Est_civil, on_delete=models.PROTECT)
    domicilio        = models.CharField(max_length=50)
    id_localidad     = models.ForeignKey(Localidades, on_delete=models.PROTECT)
    id_provincia     = models.ForeignKey(Provincias, on_delete=models.PROTECT)
    tel              = models.CharField(max_length=15)
    email            = models.EmailField(null=True, blank=True)
    saldo_licencia   = models.SmallIntegerField()
    licencia_curso   = models.SmallIntegerField()
    fecha_regreso    = models.DateField(null=True, blank=True)
    
    def __str__(self) -> str:
        return self.apellidos.upper() + ', ' + self.nombres

    
    # SE SOBRECARGA EL METODO SAVE() POR LAS DUDAS QUE
    # LA FOTO ELEGIDA PARA EL EMPLEADO SEA MUY GRANDE
    def save(self, *args, **kwargs ):
        super().save(*args, **kwargs)

        img = Image.open(self.foto.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.foto.path)
