# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0011_page_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='banner_image_2',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
        migrations.AddField(
            model_name='page',
            name='banner_image_3',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
    ]
