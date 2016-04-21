# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0076_media'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='last_edited',
            field=models.DateField(auto_now=True, null=True),
        ),
        migrations.AddField(
            model_name='media',
            name='last_edited',
            field=models.DateField(auto_now=True, null=True),
        ),
    ]
