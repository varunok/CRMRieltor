# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0035_addressfacilitydata_type_building_data'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeRepairs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_repairs', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0440\u0435\u043c\u043e\u043d\u0442\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0440\u0435\u043c\u043e\u043d\u0442\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0440\u0435\u043c\u043e\u043d\u0442\u0430',
            },
        ),
    ]
