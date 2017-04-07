# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0004_auto_20170407_1002'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='event_time',
            field=models.TimeField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='post',
            name='event_date_end',
            field=models.DateField(null=True, verbose_name=b'Event end date', blank=True),
        ),
        migrations.AlterField(
            model_name='post',
            name='event_date_start',
            field=models.DateField(null=True, verbose_name=b'Event start date', blank=True),
        ),
    ]
