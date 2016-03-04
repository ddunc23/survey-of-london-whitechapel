# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0051_auto_20160303_1610'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='description',
            field=models.CharField(max_length=140, null=True, blank=True),
        ),
        migrations.AddField(
            model_name='category',
            name='thumbnail',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
    ]
