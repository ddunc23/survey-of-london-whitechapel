# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0019_auto_20160219_1509'),
    ]

    operations = [
        migrations.AddField(
            model_name='os_feature',
            name='category',
            field=models.ForeignKey(to='map.Category', null=True),
        ),
    ]
