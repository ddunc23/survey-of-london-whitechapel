# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields
from django.conf import settings
import map.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('map', '0063_auto_20160405_1040'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('display_name', models.CharField(max_length=100, null=True, blank=True)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterModelOptions(
            name='feature',
            options={'verbose_name': 'Building'},
        ),
        migrations.AlterField(
            model_name='feature',
            name='address',
            field=models.CharField(max_length=100, verbose_name=b'Formatted Address'),
        ),
        migrations.AlterField(
            model_name='feature',
            name='b_name',
            field=models.CharField(max_length=100, null=True, verbose_name=b'Building Name', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='b_number',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Building Number', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='banner',
            field=models.ImageField(upload_to=map.models.feature_directory_path, null=True, verbose_name=b'Banner Image', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='c_area',
            field=models.CharField(max_length=8, null=True, verbose_name=b'Conservation Area', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='f_date',
            field=models.PositiveSmallIntegerField(null=True, verbose_name=b'Facade Data', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='geom',
            field=django.contrib.gis.db.models.fields.MultiPolygonField(srid=4326, verbose_name=b'Footprint Geometry'),
        ),
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.CharField(max_length=8, null=True, verbose_name=b'Listed', blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='thumbnail',
            field=models.ImageField(upload_to=map.models.feature_directory_path, null=True, verbose_name=b'Thumbnail Image', blank=True),
        ),
    ]
