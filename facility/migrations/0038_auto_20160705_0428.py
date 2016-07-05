# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0037_addressfacilitydata_repairs'),
    ]

    operations = [
        migrations.AddField(
            model_name='addressfacilitydata',
            name='area_badroom',
            field=models.CharField(max_length=10, null=True, verbose_name='\u0421\u043f\u0430\u043b\u044c\u043d\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='area_extra_room',
            field=models.CharField(max_length=10, null=True, verbose_name='\u0414\u043e\u043f\u043e\u043b.\u043a\u043e\u043c\u043d\u0430\u0442\u0430 \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='area_kitchen',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041a\u0443\u0445\u043d\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='area_living_room',
            field=models.CharField(max_length=10, null=True, verbose_name='\u0413\u043e\u0441\u0442\u0438\u043d\u043d\u0430\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='comment',
            field=models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='first_floor',
            field=models.BooleanField(default=0, verbose_name=b'\xd0\x9f\xd0\xb5\xd1\x80\xd0\xb2\xd1\x8b\xd0\xb9'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='floor',
            field=models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='floors_up',
            field=models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u0434\u043e', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='landmark',
            field=models.CharField(max_length=500, null=True, verbose_name='\u041e\u0440\u0438\u0435\u043d\u0442\u0438\u0440', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='last_floor',
            field=models.BooleanField(default=1, verbose_name=b'\xd0\x9f\xd0\xbe\xd1\x81\xd0\xbb\xd0\xb5\xd0\xb4\xd0\xbd\xd0\xb8\xd0\xb9'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='number_of_floors',
            field=models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u043e\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='payments',
            field=models.CharField(max_length=100, null=True, verbose_name='\u041f\u043b\u0430\u0442\u0435\u0436\u0438', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='rooms',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='total_area',
            field=models.CharField(max_length=10, null=True, verbose_name='\u041e\u0431\u0449\u0430\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True),
        ),
    ]
