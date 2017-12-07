# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0108_auto_20170221_1005'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='date_published',
            field=models.DateField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='image',
            name='date_published',
            field=models.DateField(null=True, blank=True),
        ),
        migrations.AddField(
            model_name='media',
            name='date_published',
            field=models.DateField(null=True, blank=True),
        ),
    ]
