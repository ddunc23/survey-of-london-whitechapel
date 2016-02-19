# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0020_os_feature_category'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name_plural': 'Categories'},
        ),
        migrations.RemoveField(
            model_name='os_feature',
            name='category',
        ),
        migrations.AddField(
            model_name='os_feature',
            name='categories',
            field=models.ManyToManyField(to='map.Category'),
        ),
    ]
