# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0081_auto_20160510_1343'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='short_description',
            field=models.CharField(max_length=140, null=True, blank=True),
        ),
    ]
