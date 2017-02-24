# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('setting_mail_delivery', '0003_auto_20160916_2157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='settingemail',
            name='timeout',
            field=models.SmallIntegerField(default=90, validators=[django.core.validators.MaxValueValidator(message='\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435', limit_value=180), django.core.validators.MinValueValidator(message='\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u0430\u043b\u043e\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435', limit_value=30)]),
        ),
    ]
