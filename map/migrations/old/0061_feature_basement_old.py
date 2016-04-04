# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0060_remove_feature_basement'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feature',
            name='basement',
        ),
        migrations.AddField(
            model_name='feature',
            name='basement',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
    ]
