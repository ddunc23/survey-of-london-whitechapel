# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0047_auto_20160301_1520'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='order',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
