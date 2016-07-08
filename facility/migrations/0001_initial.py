# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import django.contrib.auth.models


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
        ('setting_street', '0001_initial'),
        ('setting_globall', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AddressFacilityData',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number_home', models.CharField(max_length=10, null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u0434\u043e\u043c\u0430', blank=True)),
                ('number_apartment', models.CharField(max_length=10, null=True, verbose_name='\u041d\u043e\u043c\u0435\u0440 \u043a\u0432\u0430\u0440\u0442\u0438\u044b', blank=True)),
                ('price_bay', models.IntegerField(default=0, verbose_name='\u0426\u0435\u043d\u0430(\u0432\u044b\u043a\u0443\u043f)')),
                ('price_month', models.IntegerField(default=0, verbose_name='\u0426\u0435\u043d\u0430(\u043c\u0435\u0441\u044f\u0446)')),
                ('landmark', models.CharField(max_length=500, null=True, verbose_name='\u041e\u0440\u0438\u0435\u043d\u0442\u0438\u0440', blank=True)),
                ('number_of_floors', models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u043e\u0442', blank=True)),
                ('floors_up', models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436\u043d\u043e\u0441\u0442\u044c \u0434\u043e', blank=True)),
                ('first_floor', models.BooleanField(verbose_name=b'\xd0\x9f\xd0\xb5\xd1\x80\xd0\xb2\xd1\x8b\xd0\xb9')),
                ('last_floor', models.BooleanField(verbose_name=b'\xd0\x9f\xd0\xbe\xd1\x81\xd0\xbb\xd0\xb5\xd0\xb4\xd0\xbd\xd0\xb8\xd0\xb9')),
                ('floor', models.CharField(max_length=10, null=True, verbose_name='\u042d\u0442\u0430\u0436', blank=True)),
                ('area_badroom', models.CharField(max_length=10, null=True, verbose_name='\u0421\u043f\u0430\u043b\u044c\u043d\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True)),
                ('area_kitchen', models.CharField(max_length=10, null=True, verbose_name='\u041a\u0443\u0445\u043d\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True)),
                ('area_living_room', models.CharField(max_length=10, null=True, verbose_name='\u0413\u043e\u0441\u0442\u0438\u043d\u043d\u0430\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True)),
                ('area_extra_room', models.CharField(max_length=10, null=True, verbose_name='\u0414\u043e\u043f.\u043a\u043e\u043c\u043d\u0430\u0442\u0430 \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True)),
                ('total_area', models.CharField(max_length=10, null=True, verbose_name='\u041e\u0431\u0449\u0430\u044f \u043f\u043b\u043e\u0449\u0430\u0434\u044c', blank=True)),
                ('payments', models.CharField(max_length=100, null=True, verbose_name='\u041f\u043b\u0430\u0442\u0435\u0436\u0438', blank=True)),
                ('rooms', models.CharField(max_length=10, null=True, verbose_name='\u041a\u043e\u043c\u043d\u0430\u0442', blank=True)),
                ('comment', models.TextField(null=True, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439')),
                ('commission', models.CharField(max_length=10, null=True, verbose_name='\u041a\u043e\u043c\u0438\u0441\u0441\u0438\u044f', blank=True)),
            ],
            options={
                'verbose_name': '\u0410\u0434\u0440\u0435\u0441\u0441 \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0410\u0434\u0440\u0435\u0441\u0441\u0430 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
        migrations.CreateModel(
            name='DatabasePhoneOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('db_id_owner', models.CharField(max_length=16, null=True, verbose_name='ID', blank=True)),
                ('db_phone_owner', models.CharField(max_length=16, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432',
            },
        ),
        migrations.CreateModel(
            name='PhoneOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
            options={
                'verbose_name': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u0438 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432',
            },
        ),
        migrations.CreateModel(
            name='TypeActuality',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_actuality', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0430\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u0438')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0430\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0430\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u0438',
            },
        ),
        migrations.CreateModel(
            name='TypeBuilding',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_building', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u044f')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u044f',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0441\u0442\u0440\u043e\u0435\u043d\u0438\u0439',
            },
        ),
        migrations.CreateModel(
            name='TypeCondition',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_condition', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0441\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u044f')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0441\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u044f',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0441\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u044f',
            },
        ),
        migrations.CreateModel(
            name='TypeContactOwner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_contact_owner', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u043e\u0432 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
            },
        ),
        migrations.CreateModel(
            name='TypeFacility',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_facility', models.CharField(unique=True, max_length=50, verbose_name='\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432',
            },
        ),
        migrations.CreateModel(
            name='TypeOperations',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_operations', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438', blank=True)),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0439',
            },
        ),
        migrations.CreateModel(
            name='TypeRepairs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type_repairs', models.CharField(max_length=50, unique=True, null=True, verbose_name='\u0422\u0438\u043f \u0440\u0435\u043c\u043e\u043d\u0442\u0430')),
            ],
            options={
                'verbose_name': '\u0422\u0438\u043f \u0440\u0435\u043c\u043e\u043d\u0442\u0430',
                'verbose_name_plural': '\u0422\u0438\u043f\u044b \u0440\u0435\u043c\u043e\u043d\u0442\u0430',
            },
        ),
        migrations.CreateModel(
            name='UserFullName',
            fields=[
            ],
            options={
                'proxy': True,
            },
            bases=('auth.user',),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='ContactOwner',
            fields=[
                ('addressfacilitydata_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='facility.AddressFacilityData')),
                ('agency', models.CharField(max_length=250, verbose_name='\u0410\u0433\u0435\u043d\u0441\u0442\u0432\u043e', blank=True)),
                ('name_owner', models.CharField(max_length=250, verbose_name='\u0418\u043c\u044f \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True)),
                ('review_date', models.DateField(null=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0414\u0430\u0442\u0430', blank=True)),
                ('review_time', models.TimeField(auto_now_add=True, verbose_name='\u041f\u0435\u0440\u0435\u0441\u043c\u043e\u0442\u0440 \u0412\u0440\u0435\u043c\u044f', null=True)),
                ('call_date', models.DateField(null=True, verbose_name='\u0417\u0432\u043e\u043d\u043e\u043a \u0414\u0430\u0442\u0430', blank=True)),
                ('call_time', models.TimeField(auto_now_add=True, verbose_name='\u0417\u0432\u043e\u043d\u043e\u043a \u0412\u0440\u0435\u043c\u044f', null=True)),
                ('email_owner', models.EmailField(max_length=150, null=True, verbose_name='E-mail \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True)),
                ('vip_owner', models.BooleanField(verbose_name=b'Vip')),
                ('phone_owner', models.CharField(max_length=16, null=True, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('phone_owner_plus', models.CharField(max_length=16, null=True, verbose_name='\u0414\u043e\u043f\u043e\u043b. \u0422\u0435\u043b\u0435\u0444\u043e\u043d', blank=True)),
                ('contact_owner', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u043a\u043e\u043d\u0442\u0430\u043a\u0442\u0430 \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430', blank=True, to='facility.TypeContactOwner', null=True)),
            ],
            options={
                'verbose_name': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0430',
                'verbose_name_plural': '\u041a\u043e\u043d\u0442\u0430\u043a\u0442\u044b \u0432\u043b\u0430\u0434\u0435\u043b\u044c\u0446\u0435\u0432',
            },
            bases=('facility.addressfacilitydata',),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='actuality',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0410\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u044c', blank=True, to='facility.TypeActuality', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='condition',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u043e\u0441\u0442\u043e\u044f\u043d\u0438\u0435', blank=True, to='facility.TypeCondition', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='currency',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, default=2, blank=True, to='setting_globall.NationalCarrency', null=True, verbose_name='\u0412\u0430\u043b\u044e\u0442\u0430'),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='district_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0430\u0439\u043e\u043d', to_field=b'district', blank=True, to='setting_street.District', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='list_operations',
            field=models.ManyToManyField(to='facility.TypeOperations', verbose_name='\u0422\u0438\u043f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438'),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='loyality',
            field=models.ManyToManyField(related_name='loyal', verbose_name='\u041b\u043e\u044f\u043b\u044c\u043d\u043e\u0441\u0442\u044c', to='facility.UserFullName', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='repairs',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0420\u0435\u043c\u043e\u043d\u0442', to_field=b'type_repairs', blank=True, to='facility.TypeRepairs', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='rieltor',
            field=models.ManyToManyField(to='facility.UserFullName', verbose_name='\u0420\u0438\u0435\u043b\u0442\u043e\u0440', blank=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='street_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0423\u043b\u0438\u0446\u0430', to_field=b'full_street', to='setting_street.Street', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='subway_obj',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u041c\u0435\u0442\u0440\u043e', to_field=b'subway', blank=True, to='setting_street.Subway', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='type_building_data',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0421\u0442\u0440\u043e\u0435\u043d\u0438\u0435', to_field=b'type_building', blank=True, to='facility.TypeBuilding', null=True),
        ),
        migrations.AddField(
            model_name='addressfacilitydata',
            name='type_facilit',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, verbose_name='\u0422\u0438\u043f \u043e\u0431\u0435\u043a\u0442\u0430', to_field=b'type_facility', to='facility.TypeFacility', null=True),
        ),
        migrations.AddField(
            model_name='phoneowner',
            name='phone',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, blank=True, to='facility.ContactOwner', null=True),
        ),
    ]
