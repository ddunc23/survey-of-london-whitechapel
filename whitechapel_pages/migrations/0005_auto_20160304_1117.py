# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0051_auto_20160303_1610'),
        ('whitechapel_pages', '0004_page_is_front_page'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='page',
            name='documents',
        ),
        migrations.AddField(
            model_name='page',
            name='documents',
            field=models.ManyToManyField(to='map.Document', null=True, blank=True),
        ),
        migrations.RemoveField(
            model_name='page',
            name='features',
        ),
        migrations.AddField(
            model_name='page',
            name='features',
            field=models.ManyToManyField(to='map.Feature', null=True, blank=True),
        ),
    ]
