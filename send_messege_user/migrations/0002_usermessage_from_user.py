# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('send_messege_user', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='usermessage',
            name='from_user',
            field=models.ForeignKey(related_name='from_us', on_delete=django.db.models.deletion.PROTECT, default=1, verbose_name='\u041e\u0442 \u043a\u043e\u0433\u043e?', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
    ]
