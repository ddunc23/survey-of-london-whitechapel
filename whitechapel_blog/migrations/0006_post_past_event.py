# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0005_auto_20170407_1005'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='past_event',
            field=models.BooleanField(default=False),
        ),
    ]
