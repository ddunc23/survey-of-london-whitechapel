# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('map', '0075_image_description'),
    ]

    operations = [
        migrations.CreateModel(
            name='Media',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=128)),
                ('description', models.TextField(null=True, blank=True)),
                ('url', models.URLField()),
                ('published', models.BooleanField(default=False)),
                ('pending', models.BooleanField(default=False)),
                ('author', models.ForeignKey(to=settings.AUTH_USER_MODEL, on_delete=models.SET_NULL)),
                ('feature', models.ForeignKey(to='map.Feature', on_delete=models.SET_NULL)),
            ],
        ),
    ]
