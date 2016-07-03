# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('setting_street', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AddressFacilityData',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('district_obj', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0423\u043b\u0438\u0446\u0430', to_field=b'district', to='setting_street.District', null=True)),
                ('street_obj', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0423\u043b\u0438\u0446\u0430', to_field=b'full_street', to='setting_street.Street', null=True)),
            ],
            options={
                'verbose_name': '\u0410\u0434\u0440\u0435\u0441\u0441 \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0410\u0434\u0440\u0435\u0441\u0441\u0430 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
        migrations.CreateModel(
            name='TypeFacility',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_facility', models.CharField(unique=True, max_length=50, verbose_name='\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='type_facilit',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430', to_field=b'type_facility', to='facility.TypeFacility', null=True),
        ),
    ]
