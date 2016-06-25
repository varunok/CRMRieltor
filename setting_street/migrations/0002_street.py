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
            name='Street',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('street', models.CharField(max_length=50, verbose_name='\u0423\u043b\u0438\u0446\u044b')),
                ('type_street_group', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u0443\u043b\u0438\u0446\u044b', to='setting_street.TypesStreet', null=True)),
            ],
            options={
                'verbose_name': '\u0423\u043b\u0438\u0446\u0430',
                'verbose_name_plural': '\u0423\u043b\u0438\u0446\u044b',
            },
        ),
    ]
