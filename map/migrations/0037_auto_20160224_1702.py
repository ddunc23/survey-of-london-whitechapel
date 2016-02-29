# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0036_feature_thumbnail'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='end_year',
            field=models.PositiveSmallIntegerField(null=True),
        ),
        migrations.AddField(
            model_name='document',
            name='start_year',
            field=models.PositiveSmallIntegerField(null=True),
        ),
    ]
