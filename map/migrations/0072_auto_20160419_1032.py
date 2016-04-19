# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0071_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='pending',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='image',
            name='published',
            field=models.BooleanField(default=False),
        ),
    ]
