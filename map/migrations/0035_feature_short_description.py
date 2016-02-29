# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0034_feature_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='short_description',
            field=models.CharField(max_length=140, null=True),
        ),
    ]
