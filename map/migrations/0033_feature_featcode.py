# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0032_auto_20160224_1549'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='featcode',
            field=models.PositiveSmallIntegerField(null=True),
        ),
    ]
