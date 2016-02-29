# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0033_feature_featcode'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='name',
            field=models.CharField(max_length=128, null=True),
        ),
    ]
