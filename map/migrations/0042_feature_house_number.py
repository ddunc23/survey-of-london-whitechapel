# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0041_feature_street'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='house_number',
            field=models.PositiveSmallIntegerField(null=True, blank=True),
        ),
    ]
