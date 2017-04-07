# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0003_post_event_date'),
    ]

    operations = [
        migrations.RenameField(
            model_name='post',
            old_name='event_date',
            new_name='event_date_end',
        ),
        migrations.AddField(
            model_name='post',
            name='event_date_start',
            field=models.DateTimeField(null=True, blank=True),
        ),
    ]
