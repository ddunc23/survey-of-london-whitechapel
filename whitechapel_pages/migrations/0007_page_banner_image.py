# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0006_auto_20160304_1124'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='banner_image',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
    ]
