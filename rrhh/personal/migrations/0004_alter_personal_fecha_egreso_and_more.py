# Generated by Django 4.1.1 on 2022-10-08 23:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('personal', '0003_alter_personal_fecha_egreso_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='personal',
            name='fecha_egreso',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='personal',
            name='fecha_regreso',
            field=models.DateField(blank=True, null=True),
        ),
    ]