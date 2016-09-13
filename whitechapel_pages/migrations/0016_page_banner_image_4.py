# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0015_page_blog_post'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='banner_image_4',
            field=models.ImageField(null=True, upload_to=b'', blank=True),
        ),
    ]
