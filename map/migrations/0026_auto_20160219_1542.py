# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0025_auto_20160219_1539'),
    ]

    operations = [
        migrations.AlterField(
            model_name='os_feature',
            name='categories',
            field=models.ManyToManyField(to='map.Category', blank=True),
        ),
    ]
