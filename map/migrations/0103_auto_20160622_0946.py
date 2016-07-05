# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0102_auto_20160622_0909'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='aggregate',
            field=models.BooleanField(default=False, verbose_name=b'Aggregate to Site'),
        ),
        migrations.AddField(
            model_name='media',
            name='aggregate',
            field=models.BooleanField(default=False, verbose_name=b'Aggregate to Site'),
        ),
    ]
