# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0062_feature_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='basement',
            field=models.CharField(max_length=8, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='c_area',
            field=models.CharField(max_length=8, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.CharField(max_length=8, null=True, blank=True),
        ),
    ]
