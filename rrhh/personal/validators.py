from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from datetime import date

def validate_dni(value):
    """
    validar el DNI de una persona
    """
    if not value.isnumeric() :
        raise ValidationError(_('El DNI solo puede tener números'), code='invalid')
    
    if int(value) < 100000:
        raise ValidationError(_('El DNI debe tener un mínimo de 6 dígitos'), code='invalid')
    

def validate_cuil(value):
    """
    validar el CUIL de una persona
    """
    if not value.isnumeric() :
        raise ValidationError(_('El CUIL solo puede tener números'), code='invalid')
    
    if len(value) < 11:
        raise ValidationError(_('El CUIL debe tener 11 dígitos'), code='invalid')

    
    # CALCULO Y COMPROBACION DEL DIGITO VERIFICADOR DEL CUIL
    base = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
    aux = 0
    for i in range(10):
        aux += int(value[i]) * base[i]

    aux = 11 - (aux - (int(aux / 11) * 11))
    if aux == 11:
        aux = 0
    if aux == 10:
        aux = 9

    if not aux == int(value[10]):
        raise ValidationError(_('El CUIL es incorrecto!'), code='invalid')
    # 

def validate_fecha_nacimiento(value):
    """
    validar la fecha de nacimiento de una persona
    """
    if value > date.today() :
        raise ValidationError(_('Fecha incorrecta, la persona todavía no nació!'), code='invalid')
    

def validate_fecha_ingreso(value):
    """
    validar la fecha de ingreso de una persona
    """
    if value > date.today() :
        raise ValidationError(_('Fecha incorrecta, la persona todavía no puede haber ingresado!'), code='invalid')
        
    # CHEQUEAR QUE LA FECHA DE INGRESO SEA MAYOR QUE LA FECHA DE NACIMIENTO
    # if value > date.today() :
    #     raise ValidationError(_('Fecha incorrecta, la persona todavía no puede haber ingresado!'), code='invalid')
    
    