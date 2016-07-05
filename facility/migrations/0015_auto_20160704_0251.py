# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0014_contactowner_agency'),
    ]

    operations = [
        migrations.AddField(
            model_name='contactowner',
            name='name_owner',
            field=models.CharField(max_length=250, verbose_name='\u0418\u043c\u044f \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True),
        ),
        migrations.AddField(
            model_name='contactowner',
            name='review_date',
            field=models.DateField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440'),
        ),
    ]
