# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('send_messege_user', '0002_usermessage_from_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='usermessage',
            name='time_message',
            field=models.DateTimeField(default=datetime.datetime(2016, 7, 23, 2, 39, 11, 104599), verbose_name=b'\xd0\x92\xd1\x80\xd0\xb5\xd0\xbc\xd1\x8f \xd0\xbe\xd1\x82\xd0\xbf\xd1\x80\xd0\xb0\xd0\xb2\xd0\xba\xd0\xb8', auto_now_add=True),
            preserve_default=False,
        ),
    ]
