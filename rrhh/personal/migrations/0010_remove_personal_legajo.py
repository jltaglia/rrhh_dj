# Generated by Django 4.1.1 on 2022-10-13 22:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0009_alter_personal_apellidos_alter_personal_cuil_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='personal',
            name='legajo',
        ),
    ]
