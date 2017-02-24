# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('single_object', '0003_auto_20160926_1036'),
        ('facility', '0004_auto_20160928_0211'),
        ('arendator', '0004_arendator_add_date'),
        ('single_arendator', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Shows',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('array_arendator', models.ForeignKey(to='arendator.Arendator', null=True)),
                ('array_cont_ower', models.ForeignKey(to='facility.ContactOwner', null=True)),
                ('type_shows_arendator', models.ForeignKey(default=1, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0443', to='single_object.TypeShows', null=True)),
            ],
            options={
                'verbose_name': '\u041f\u043e\u043a\u0430\u0437 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0443',
                'verbose_name_plural': '\u041f\u043e\u043a\u0430\u0437\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430\u043c',
            },
        ),
    ]
