# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0005_auto_20160304_1117'),
    ]

    operations = [
        migrations.AlterField(
            model_name='page',
            name='documents',
            field=models.ManyToManyField(to='map.Document', blank=True),
        ),
        migrations.AlterField(
            model_name='page',
            name='features',
            field=models.ManyToManyField(to='map.Feature', blank=True),
        ),
    ]
