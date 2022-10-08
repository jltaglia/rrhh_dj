from pathlib import Path
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('filter/', views.filter, name='filter'),
    path('create/', views.create, name='create'),
]
