from .models import Legajos
from personal.models import Personal, Eventos

def busca_evento_anterior(persona, **kwargs):
    '''
    SE UTILIZA PARA RECUPERAR DE LA TABLA DE 
    LEGAJOS EL EVENTO ANTERIOR AL INGRESADO
    PARA EL EMPLEADO
    '''
    eventos_empleado = Legajos.objects.filter(id_empleado_id=persona).order_by('-id')
    
    # print('eventos_empleado\n', eventos_empleado)
    # for evento in eventos_empleado:
    #     print(len(eventos_empleado),'\n', evento.fecha_desde, evento.fecha_hasta, evento.cantidad)
    # input()
     
    
    if len(eventos_empleado) > 0: # SI HAY EVENTOS ANTERIORES
        evento_ant = eventos_empleado[0]
    else:
        evento_ant = False
    
    return evento_ant