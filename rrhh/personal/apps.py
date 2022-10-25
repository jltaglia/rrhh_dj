from django.apps import AppConfig


class PersonalConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'personal'
    
    # PARA CONECTAR LAS SIGNALS CON LOS HANDLERS
    def ready(self):
        import personal.signals
