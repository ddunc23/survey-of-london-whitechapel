# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0057_auto_20160404_1133'),
    ]

    operations = [
        # migrations.AddField(
        #    model_name='feature',
        #    name='basement',
        #    field=models.PositiveSmallIntegerField(max_length=1, null=True, blank=True),
        #),
        migrations.RemoveField(
            model_name='feature',
            name='c_area',
        ),
        migrations.AddField(
            model_name='feature',
            name='c_area',
            field=models.PositiveSmallIntegerField(max_length=1, null=True, blank=True),
        ),
        migrations.RemoveField(
            model_name='feature',
            name='listed',
        ),
        migrations.AddField(
            model_name='feature',
            name='listed',
            field=models.PositiveSmallIntegerField(max_length=1, null=True, blank=True),
        ),
    ]
