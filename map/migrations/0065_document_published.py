# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0064_auto_20160407_1158'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='published',
            field=models.BooleanField(default=False),
        ),
    ]
