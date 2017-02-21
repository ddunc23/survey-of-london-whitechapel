# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0107_image_copyright'),
    ]

    operations = [
        migrations.AddField(
            model_name='feature',
            name='demolished',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='document',
            name='author',
            field=models.ForeignKey(related_name='documents', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='document',
            name='feature',
            field=models.ForeignKey(related_name='documents', to='map.Feature'),
        ),
        migrations.AlterField(
            model_name='image',
            name='author',
            field=models.ForeignKey(related_name='images', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='image',
            name='feature',
            field=models.ForeignKey(related_name='images', to='map.Feature'),
        ),
        migrations.AlterField(
            model_name='media',
            name='author',
            field=models.ForeignKey(related_name='media', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='media',
            name='feature',
            field=models.ForeignKey(related_name='media', to='map.Feature'),
        ),
    ]
