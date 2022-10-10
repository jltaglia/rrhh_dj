from pathlib import Path
from django.urls import path
from . import views
from .views import Detalle_Empleado

urlpatterns = [
    path('', views.index, name='index'),
    path('filter/', views.filter, name='filter'),
    path('create/', views.create, name='create'),
    path('personal_detail/<int:pk>/', Detalle_Empleado.as_view(), name='show'),
]
