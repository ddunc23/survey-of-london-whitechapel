# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import map.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('map', '0070_auto_20160419_1010'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=128)),
                ('caption', models.CharField(max_length=255)),
                ('image', models.ImageField(upload_to=map.models.feature_directory_path, null=True, verbose_name=b'Image', blank=True)),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL, on_delete=models.SET_NULL)),
                ('feature', models.ForeignKey(to='map.Feature', on_delete=models.SET_NULL)),
            ],
        ),
    ]
