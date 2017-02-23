# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('meeting', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='meeting',
            name='meet_arendator',
            field=models.ForeignKey(verbose_name='ID(A) \u0410\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440', blank=True, to='arendator.Arendator', null=True),
        ),
        migrations.AlterField(
            model_name='meeting',
            name='meet_buyer',
            field=models.ForeignKey(verbose_name='ID(P) \u041f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044c', blank=True, to='buyer.Buyer', null=True),
        ),
    ]
