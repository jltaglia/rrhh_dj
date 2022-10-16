# Generated by Django 4.1.1 on 2022-10-15 21:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0010_remove_personal_legajo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personal',
            name='licencia_curso',
            field=models.SmallIntegerField(default=2022, verbose_name='Licencia en Curso'),
        ),
        migrations.AlterField(
            model_name='personal',
            name='saldo_licencia',
            field=models.SmallIntegerField(default=14, verbose_name='Saldo de Licencia'),
        ),
    ]
