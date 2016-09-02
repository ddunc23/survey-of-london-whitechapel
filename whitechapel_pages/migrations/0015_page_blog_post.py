# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_blog', '0002_auto_20160830_1422'),
        ('whitechapel_pages', '0014_remove_page_features'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='blog_post',
            field=models.ForeignKey(verbose_name=b'Featured Event', blank=True, to='whitechapel_blog.Post', null=True),
        ),
    ]
