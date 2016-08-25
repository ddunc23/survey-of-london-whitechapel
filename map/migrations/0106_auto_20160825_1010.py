# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0105_feature_feature_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='feature',
            name='feature_type',
            field=models.CharField(default=b'WHITECHAPEL_BUILDING', max_length=100, verbose_name=b'Feature Type', choices=[(b'WHITECHAPEL_BUILDING', b'Building in Whitechapel'), (b'GREATER_WHITECHAPEL', b'Building in Greater Whitechapel'), (b'OPEN_SPACE', b'Open Space'), (b'PLACE', b'Area or Market')]),
        ),
    ]
