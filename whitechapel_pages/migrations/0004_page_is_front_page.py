# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0003_page_features'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='is_front_page',
            field=models.BooleanField(default=False),
        ),
    ]
