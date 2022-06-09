# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0051_auto_20160303_1610'),
        ('whitechapel_pages', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='documents',
            field=models.ForeignKey(blank=True, to='map.Document', null=True, on_delete=models.SET_NULL),
        ),
    ]
