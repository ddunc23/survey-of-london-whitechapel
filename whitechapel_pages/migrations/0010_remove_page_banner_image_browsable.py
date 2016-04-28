# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0009_page_banner_image_browsable'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='page',
            name='banner_image_browsable',
        ),
    ]
