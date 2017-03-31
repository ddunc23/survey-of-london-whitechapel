# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0002_auto_20160830_1422'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='event_date',
            field=models.DateTimeField(null=True, blank=True),
        ),
    ]
