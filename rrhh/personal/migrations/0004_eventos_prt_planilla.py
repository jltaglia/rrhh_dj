# Generated by Django 4.1.3 on 2023-02-11 20:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0003_alter_personal_licencia_curso'),
    ]

    operations = [
        migrations.AddField(
            model_name='eventos',
            name='prt_planilla',
            field=models.BooleanField(default=True),
        ),
    ]
