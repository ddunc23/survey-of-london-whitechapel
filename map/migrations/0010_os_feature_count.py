# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0009_document_body'),
    ]

    operations = [
        migrations.AddField(
            model_name='os_feature',
            name='count',
            field=models.PositiveSmallIntegerField(default=0),
        ),
    ]
