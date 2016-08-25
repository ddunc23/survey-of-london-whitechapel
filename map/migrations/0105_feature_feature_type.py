# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0104_auto_20160812_1537'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='feature_type',
            field=models.CharField(default=b'WHITECHAPEL_BUILDING', max_length=100, verbose_name=b'Feature Type', choices=[(b'WHITECHAPEL_BUILDING', b'Building in Whitechapel'), (b'GREATER_WHITECHAPEL', b'Building in Greater Whitechapel'), (b'OPEN_SPACE', b'Open Space')]),
        ),
    ]
