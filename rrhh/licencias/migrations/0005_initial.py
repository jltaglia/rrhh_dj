# Generated by Django 4.1.3 on 2023-01-23 20:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('licencias', '0004_delete_legajos'),
    ]

    operations = [
        migrations.CreateModel(
            name='Legajos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_empleado', models.SmallIntegerField()),
                ('fecha_desde', models.DateField()),
                ('fecha_hasta', models.DateField()),
                ('id_evento', models.SmallIntegerField()),
                ('cantidad', models.SmallIntegerField()),
                ('borrable', models.SmallIntegerField()),
                ('afecta_vac', models.SmallIntegerField()),
            ],
        ),
    ]
