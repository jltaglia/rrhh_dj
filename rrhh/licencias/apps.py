from django.apps import AppConfig


class LicenciasConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'licencias'

    # PARA CONECTAR LAS SIGNALS CON LOS HANDLERS
    def ready(self):
        import licencias.signals
