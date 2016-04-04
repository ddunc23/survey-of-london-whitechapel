# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0061_feature_basement'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='type',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]
