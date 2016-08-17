# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0012_auto_20160815_0932'),
    ]

    operations = [
        migrations.RenameField(
            model_name='page',
            old_name='banner_image',
            new_name='banner_image_1',
        ),
    ]
