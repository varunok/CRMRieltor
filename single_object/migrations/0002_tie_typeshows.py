# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0018_auto_20160727_2339'),
        ('facility', '0002_auto_20160725_0144'),
        ('single_object', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('comment_arendator', models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439', blank=True)),
                ('tie_arenda', models.ManyToManyField(to='arendator.Arendator', verbose_name='\u0421\u0432\u044f\u0437\u043a\u0430 \u043e\u0431\u0435\u043a\u0442\u0430 \u0441 \u0430\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u043e\u043c', blank=True)),
                ('tie_cont_owner', models.OneToOneField(verbose_name='\u041e\u0431\u0435\u043a\u0442', to='facility.ContactOwner')),
            ],
            options={
                'verbose_name': '\u0421\u0432\u044f\u0437\u043a\u0430',
                'verbose_name_plural': '\u0421\u0432\u044f\u0437\u043a\u0438',
            },
        ),
        migrations.CreateModel(
            name='TypeShows',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_shows', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043f\u043e\u043a\u0430\u0437\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043f\u043e\u043a\u0430\u0437\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u041f\u043e\u043a\u0430\u0437\u043e\u0432',
            },
        ),
    ]
