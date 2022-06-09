# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0100_auto_20160621_1312'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feature',
            name='site',
        ),
        migrations.AddField(
            model_name='feature',
            name='site',
            field=models.ForeignKey(blank=True, to='map.Site', null=True, on_delete=models.SET_NULL),
        ),
    ]
