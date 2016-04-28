# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0077_auto_20160421_1404'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='b_number',
            field=models.CharField(max_length=16, null=True, verbose_name=b'Building Number', blank=True),
        ),
    ]
