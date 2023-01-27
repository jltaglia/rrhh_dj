# Generated by Django 4.1.1 on 2022-10-07 21:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Legajos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_desde', models.DateField()),
                ('fecha_hasta', models.DateField()),
                ('cantidad', models.SmallIntegerField()),
                ('borrable', models.SmallIntegerField()),
                ('afecta_vac', models.SmallIntegerField()),
                ('id_empleado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='personal.personal')),
                ('id_evento', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='personal.eventos')),
            ],
        ),
    ]
