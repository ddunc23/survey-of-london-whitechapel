# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0055_auto_20160404_1101'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='id',
            field=models.PositiveSmallIntegerField(serialize=False, primary_key=True),
        ),
    ]
