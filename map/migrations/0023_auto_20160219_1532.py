# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0022_story'),
    ]

    operations = [
        migrations.AddField(
            model_name='story',
            name='neighbourhood',
            field=models.ForeignKey(to='map.Neighbourhood', null=True),
        ),
        migrations.AlterField(
            model_name='story',
            name='os_id',
            field=models.ForeignKey(to='map.OS_Feature', null=True),
        ),
    ]
