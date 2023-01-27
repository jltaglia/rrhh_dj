from .models import Legajos
from personal.models import Personal
from django.dispatch import receiver
from django.db.models.signals import post_save
import os


@receiver(post_save, sender=Legajos)
def accion_pos_evento(sender, instance, **kwargs):
    """
    Realiza todas las tareas luego de ingresar un
    nuevo evento.
    """
    
    # print(dir(sender))
    # print('--------------------------------------------------')
    # print(sender.id)
    # print(sender.id_empleado)
    # print(sender.id_empleado_id)
    # print(sender.id_evento)
    # print(sender.id_evento_id)
    # print(dir(sender.objects))
    # print(sender.pk)
    # print('--------------------------------------------------')
    # print(instance.id)
    # print(instance.id_empleado)
    # print(instance.id_empleado_id)
    # print(instance.id_evento)
    # print(instance.id_evento_id)
    # print(instance.pk)
    print('--------------------------------------------------')
    
    id_persona_act = instance.id_empleado_id
    id_evento_act = instance.id

    print('Cod Persona:', id_persona_act)
    print('Cod de Evento:', id_evento_act)
    
    input()