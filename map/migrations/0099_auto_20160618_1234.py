# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0098_auto_20160618_1217'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='b_type',
            field=models.CharField(max_length=100, null=True, verbose_name=b'Building Type', blank=True),
        ),
    ]
