from django.db import models

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
    foto             = models.FilePathField(path='/static/personal/img', max_length=50)
    legajo           = models.SmallIntegerField()
    apellidos        = models.CharField(max_length=30)
    nombres          = models.CharField(max_length=40)
    id_documento     = models.SmallIntegerField()
    documento        = models.IntegerField()
    cuil             = models.IntegerField()
    fecha_nacimiento = models.DateField()
    fecha_ingreso    = models.DateField()
    fecha_egreso     = models.DateField()
    id_categoria     = models.SmallIntegerField()
    id_est_civil     = models.SmallIntegerField()
    domicilio        = models.CharField(max_length=50)
    id_localidad     = models.IntegerField()
    id_provincia     = models.SmallIntegerField()
    tel              = models.CharField(max_length=15)
    email            = models.EmailField()
    saldo_licencia   = models.SmallIntegerField()
    licencia_curso   = models.SmallIntegerField()
    fecha_regreso    = models.DateField()
    
    def __str__(self) -> str:
        return self.apellidos.upper() + ', ' + self.nombres

