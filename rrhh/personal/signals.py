from .models import Personal
from django.dispatch import receiver
from django.db.models.signals import pre_save, post_delete
import os


@receiver(post_delete, sender=Personal)
def auto_delete_foto_on_delete(sender, instance, **kwargs):
    """
    Borra el archivo de imagen del sistema de archivos
    cuando el objeto al cual pertenece la imagen es
    borrado de la base de datos (el empleado es dado de baja).
    """
    if instance.foto:
        if os.path.isfile(instance.foto.path):
            os.remove(instance.foto.path)


@receiver(pre_save, sender=Personal)
def auto_delete_foto_on_change(sender, instance, **kwargs):
    """
    Borra el archivo de imagen del sistema de archivos
    cuando el objeto de referencia es modificado
    (se cambia la foto del empleado).
    """
    # SI ES UN NUEVO OBJETO (ALTA) NO BORRA LA IMAGEN ANTERIOR
    if not instance.pk:
        return False
    
    try:
        old_file = sender.objects.get(pk=instance.pk).foto.path
    except sender.DoesNotExist:
        return False
    
    # COMPARA LA FOTO NUEVA CON LA ANTERIOR
    file = instance.foto.path
    if not old_file == file:
        if os.path.isfile(old_file):
            os.remove(old_file)

