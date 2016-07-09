# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0007_delete_imagesalbum'),
    ]

    operations = [
        migrations.CreateModel(
            name='ImagesFacility',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('image', models.ImageField(upload_to=b'img_obj', verbose_name='\u0424\u043e\u0442\u043e')),
                ('album', models.ForeignKey(related_name='photos', on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0410\u043b\u044c\u0431\u043e\u043c', to='facility.AddressFacilityData')),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0442\u043e \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0424\u043e\u0442\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
    ]
