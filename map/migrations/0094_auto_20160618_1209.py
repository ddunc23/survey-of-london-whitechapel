# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0093_auto_20160618_1204'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='basement',
            field=models.CharField(default=b'NO', max_length=8, null=True, blank=True, choices=[(b'YES', b'Yes'), (b'NO', b'No')]),
        ),
    ]
