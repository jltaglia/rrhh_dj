from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from datetime import date

def validate_fecha_desde(value):
    """
    validar la fecha de comienzo de un evento
    """
    if value < date.today() :
        raise ValidationError(_('Fecha incorrecta, la fecha no puede ser anterior al día de la fecha!'), code='invalid')
    

def validate_fecha_hasta(value):
    """
    validar la fecha de finalización de un evento
    """
    if value < date.today() :
        raise ValidationError(_('Fecha incorrecta, la fecha no puede ser anterior al día de la fecha!'), code='invalid')
    