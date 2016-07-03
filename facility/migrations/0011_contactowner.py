# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('facility', '0010_typecontactowner'),
    ]

    operations = [
        migrations.CreateModel(
            name='ContactOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('contact_owner', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='facility.TypeContactOwner', null=True)),
            ],
            options={
                'verbose_name': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
            },
        ),
    ]
