from .models import Legajos
from personal.models import Personal, Eventos
from django.dispatch import receiver
from django.db.models.signals import post_save
import os
from .services import busca_evento_anterior

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
    # print(dir(instance))
    print('instance.afecta_vac , instance.borrable, instance.cantidad, instance.fecha_desde, instance.fecha_hasta,instance.id, instance.id_empleado, instance.id_empleado_id, instance.id_evento, instance.id_evento_id, instance.pk')
    print(instance.afecta_vac , 
          instance.borrable, 
          instance.cantidad, 
          instance.fecha_desde, 
          instance.fecha_hasta,
          type(instance.id),
          instance.id_empleado, 
          instance.id_empleado_id, 
          instance.id_evento, 
          instance.id_evento_id, 
          instance.pk)
    print('--------------------------------------------------')
    
    id_persona_act = instance.id_empleado_id
    id_evento_act = instance.id

    print('id Persona:', id_persona_act)
    print('id de Evento:', id_evento_act)
    
    
    # ------------------------------------------------------------------------------
    # BUSCA LA ANTEULTIMA LICENCIA (SI EXISTE)
    # PARA ACTUALIZAR EL ESTADO DE LA MISMA 
    # DE BORRRABLE A "NO" BORRABLE. 
    # ------------------------------------------------------------------------------

    evento_ant = busca_evento_anterior(id_persona_act)     
    if evento_ant: # SI HAY EVENTOS ANTERIORES
        print('afecta_vac ,borrable, cantidad, fecha_desde, fecha_hasta, id, id_empleado, id_empleado_id, id_evento, id_evento_id, pk')
        print(evento_ant.afecta_vac,
              evento_ant.borrable,
              evento_ant.cantidad,
              evento_ant.fecha_desde,
              evento_ant.fecha_hasta,
              evento_ant.id,
              evento_ant.id_empleado,
              evento_ant.id_empleado_id,
              evento_ant.id_evento,
              evento_ant.id_evento_id,
              evento_ant.pk,
              )
        if evento_ant.borrable:
            Legajos.objects.filter(id=evento_ant.id).update(borrable=False)
        
        print(evento_ant.borrable)
        input()


        
    # 
    # PARA SABER SI SEGUN EL EVENTO SE IMPRIME UNA PLANILLA
    tipo_evento = Eventos.objects.get(pk=instance.id_evento_id)
    imprime_planilla = tipo_evento.prt_planilla
    # 
    # 
    
    if imprime_planilla:
        print('imprime')
    else:
        print('NO imprime')
    
    input()
    