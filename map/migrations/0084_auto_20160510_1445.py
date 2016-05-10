# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0083_auto_20160510_1431'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='document_type',
            field=models.CharField(default=b'HISTORY', max_length=16, choices=[(b'HISTORY', b'Research'), (b'DESCRIPTION', b'Description'), (b'STORY', b'Memory')]),
        ),
    ]
