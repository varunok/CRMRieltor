# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('buyer', '0001_initial'),
        ('facility', '0003_auto_20160802_0053'),
        ('single_object', '0007_auto_20160802_0053'),
    ]

    operations = [
        migrations.CreateModel(
            name='ShowsBuyer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('array_buyer', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='buyer.Buyer', null=True)),
                ('array_cont_ower', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='facility.ContactOwner', null=True)),
                ('type_shows_buyer', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, default=1, verbose_name='\u041f\u043e\u043a\u0430\u0437\u0438 \u041f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044e', to='single_object.TypeShows', null=True)),
            ],
            options={
                'verbose_name': '\u041f\u043e\u043a\u0430\u0437 \u043f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044e',
                'verbose_name_plural': '\u041f\u043e\u043a\u0430\u0437\u0438 \u043f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u044f\u043c',
            },
        ),
        migrations.CreateModel(
            name='TieBuyer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tie_buye', models.ManyToManyField(to='buyer.Buyer', verbose_name='\u0421\u0432\u044f\u0437\u043a\u0430 \u043e\u0431\u0435\u043a\u0442\u0430 \u0441 \u043f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u0435\u043c', blank=True)),
                ('tie_cont_owner', models.OneToOneField(verbose_name='\u041e\u0431\u0435\u043a\u0442', to='facility.ContactOwner')),
            ],
            options={
                'verbose_name': '\u0421\u0432\u044f\u0437\u043a\u0430 \u0441 \u043f\u043e\u043a\u0443\u043f\u0430\u0442\u0435\u043b\u0435\u043c',
                'verbose_name_plural': '\u0421\u0432\u044f\u0437\u043a\u0438',
            },
        ),
        migrations.AlterModelOptions(
            name='tie',
            options={'verbose_name': '\u0421\u0432\u044f\u0437\u043a\u0430 \u0441 \u0430\u0440\u0435\u043d\u0434\u0430\u0442\u043e\u0440\u043e\u043c', 'verbose_name_plural': '\u0421\u0432\u044f\u0437\u043a\u0438'},
        ),
        migrations.RemoveField(
            model_name='tie',
            name='comment_arendator',
        ),
    ]
