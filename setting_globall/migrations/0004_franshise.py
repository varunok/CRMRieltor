# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setting_globall', '0003_auto_20160805_0342'),
    ]

    operations = [
        migrations.CreateModel(
            name='Franshise',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('franshise', models.CharField(max_length=100, null=True, verbose_name='\u0424\u0440\u0430\u043d\u0448\u0438\u0437\u0430', blank=True)),
            ],
            options={
                'verbose_name': '\u0424\u0440\u0430\u043d\u0448\u0438\u0437\u0430',
            },
        ),
    ]
