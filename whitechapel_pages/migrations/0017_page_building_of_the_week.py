# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0106_auto_20160825_1010'),
        ('whitechapel_pages', '0016_page_banner_image_4'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='building_of_the_week',
            field=models.ForeignKey(verbose_name=b'Building of the Week', blank=True, to='map.Feature', null=True),
        ),
    ]
