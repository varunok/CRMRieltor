# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('arendator', '0018_auto_20160727_2339'),
        ('single_object', '0002_tie_typeshows'),
    ]

    operations = [
        migrations.CreateModel(
            name='ShowsArendator',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('array_arendator', models.ForeignKey(to='arendator.Arendator', on_delete=django.db.models.deletion.PROTECT)),
                ('type_shows_arendator', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c', blank=True, to='single_object.TypeShows', null=True)),
            ],
            options={
                'verbose_name': '\u041f\u043e\u043a\u0430\u0437 \u0430\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c',
                'verbose_name_plural': '\u041f\u043e\u043a\u0430\u0437\u0438 \u0430\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u0430\u043c',
            },
        ),
    ]
