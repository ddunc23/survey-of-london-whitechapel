# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0058_auto_20160404_1138'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='basement',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='c_area',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='feature',
            name='listed',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
    ]
