# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0011_os_feature_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='os_feature',
            name='FEATCODE',
            field=models.CharField(max_length=255, blank=True),
        ),
    ]
