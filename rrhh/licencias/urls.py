from django.urls import path, include
from licencias.views import (Lista_Licencias,
                             Nueva_Licencia,
                            )

licencias_patterns = ([
    path('licencias_lista/<int:pk>/', Lista_Licencias.as_view(), name='licencias-listado'),
    path('licencias_nvas/<int:pk>/', Nueva_Licencia.as_view(), name='licencias-nuevas'),
], 'licencias')

urlpatterns = [
     path('', include(licencias_patterns)),
]