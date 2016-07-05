# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0101_auto_20160621_1316'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='document',
            name='anonymise',
        ),
        migrations.AddField(
            model_name='document',
            name='aggregate',
            field=models.BooleanField(default=False, verbose_name=b'Aggregate to Site'),
        ),
    ]
