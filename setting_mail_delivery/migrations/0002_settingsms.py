# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_mail_delivery', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SettingSMS',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('sender', models.CharField(max_length=150, verbose_name='\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u0440\u0430\u0441\u0441\u044b\u043b\u043e\u043a SMS')),
                ('login', models.CharField(max_length=150, verbose_name='\u041b\u043e\u0433\u0438\u043d')),
                ('password', models.CharField(max_length=150, verbose_name='\u041f\u0430\u0440\u043e\u043b\u044c')),
            ],
            options={
                'verbose_name': '\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u0440\u0430\u0441\u0441\u044b\u043b\u043e\u043a SMS',
                'verbose_name_plural': '\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u0440\u0430\u0441\u0441\u044b\u043b\u043e\u043a SMS',
            },
        ),
    ]
