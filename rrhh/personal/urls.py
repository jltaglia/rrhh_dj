from pathlib import Path
from django.urls import path
from . import views
from .views import (Edita_Empleado,
                    Detalle_Empleado,
                    Baja_Empleado)

urlpatterns = [
    path('', views.index, name='personal-index'),
    path('filter/', views.filter, name='personal-filter'),
    path('create/', views.create, name='personal-create'),
    path('personal_update_form/<int:pk>/', Edita_Empleado.as_view(), name='personal-edit'),
    path('personal_detail/<int:pk>/', Detalle_Empleado.as_view(), name='personal-detalle'),
    path('personal_confirm_delete/<int:pk>/', Baja_Empleado.as_view(), name='personal-baja'),
]
