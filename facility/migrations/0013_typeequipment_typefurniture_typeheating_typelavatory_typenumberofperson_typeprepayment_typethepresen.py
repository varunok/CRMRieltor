# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0012_auto_20160710_0024'),
    ]

    operations = [
        migrations.CreateModel(
            name='TypeEquipment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_equipment', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0442\u0435\u0445\u043d\u0438\u043a\u0438')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0442\u0435\u0445\u043d\u0438\u043a\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0442\u0435\u0445\u043d\u0438\u043a',
            },
        ),
        migrations.CreateModel(
            name='TypeFurniture',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_furniture', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041c\u0435\u0431\u0435\u043b\u0438')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041c\u0435\u0431\u0435\u043b\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041c\u0435\u0431\u0435\u043b\u0438',
            },
        ),
        migrations.CreateModel(
            name='TypeHeating',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_heating', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041e\u0442\u043e\u043f\u043b\u0435\u043d\u0438\u044f')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041e\u0442\u043e\u043f\u043b\u0435\u043d\u0438\u044f',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041e\u0442\u043e\u043f\u043b\u0435\u043d\u0438\u0439',
            },
        ),
        migrations.CreateModel(
            name='TypeLavatory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_lavatory', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0421\u0430\u043d\u0443\u0437\u043b\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0421\u0430\u043d\u0443\u0437\u043b\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0421\u0430\u043d\u0443\u0437\u043b\u043e\u0432',
            },
        ),
        migrations.CreateModel(
            name='TypeNumberOfPerson',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_number_of_persons', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0447\u0435\u043b\u043e\u0432\u0435\u043a')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0447\u0435\u043b\u043e\u0432\u0435\u043a',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0447\u0435\u043b\u043e\u0432\u0435\u043a',
            },
        ),
        migrations.CreateModel(
            name='TypePrepayment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_prepayment', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041f\u0440\u0435\u0434\u043e\u043f\u043b\u0430\u0442\u044b')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041f\u0440\u0435\u0434\u043e\u043f\u043b\u0430\u0442\u044b',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041f\u0440\u0435\u0434\u043e\u043f\u043b\u0430\u0442',
            },
        ),
        migrations.CreateModel(
            name='TypeThePresenceOfHotWater',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_the_presence_of_hot_water', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041d\u0430\u043b\u0438\u0447\u0438\u0435 \u0433\u043e\u0440\u044f\u0447\u0435\u0439 \u0432\u043e\u0434\u044b')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041d\u0430\u043b\u0438\u0447\u0438\u0435 \u0433\u043e\u0440\u044f\u0447\u0435\u0439 \u0432\u043e\u0434\u044b',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041d\u0430\u043b\u0438\u0447\u0438\u0435 \u0433\u043e\u0440\u044f\u0447\u0435\u0439 \u0432\u043e\u0434\u044b',
            },
        ),
        migrations.CreateModel(
            name='TypeWhereToStay',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_where_to_stay', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0413\u0434\u0435 \u0441\u043f\u0430\u0442\u044c?')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0413\u0434\u0435 \u0441\u043f\u0430\u0442\u044c?',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0413\u0434\u0435 \u0441\u043f\u0430\u0442\u044c?',
            },
        ),
        migrations.CreateModel(
            name='TypeWindows',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_windows', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u041e\u043a\u043d\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u041e\u043a\u043d\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041e\u043a\u043e\u043d',
            },
        ),
    ]
