from django.urls import path
from . import views
from .views import (Ingreso_Filtro_Empleado,
                    Filtra_Empleado,
                    Lista_Empleado,
                    Edita_Empleado,
                    Nuevo_Empleado,
                    Detalle_Empleado,
                    Baja_Empleado)

urlpatterns = [
    path('', Lista_Empleado.as_view(), name='personal-index'),
    path('personal_filter/', Ingreso_Filtro_Empleado.as_view(), name='personal-filtro'),
    path('personal_filtrado/', Filtra_Empleado.as_view(), name='personal-filtrar'),
    path('personal_create_form/', Nuevo_Empleado.as_view(), name='personal-alta'),
    path('personal_update_form/<int:pk>/', Edita_Empleado.as_view(), name='personal-editar'),
    path('personal_detail/<int:pk>/', Detalle_Empleado.as_view(), name='personal-detalle'),
    path('personal_confirm_delete/<int:pk>/', Baja_Empleado.as_view(), name='personal-baja'),
]
