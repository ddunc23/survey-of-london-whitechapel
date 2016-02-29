# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0030_auto_20160224_1547'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='categories',
            field=models.ManyToManyField(to='map.Category', blank=True),
        ),
    ]
