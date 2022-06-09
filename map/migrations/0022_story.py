# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0021_auto_20160219_1517'),
    ]

    operations = [
        migrations.CreateModel(
            name='Story',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=128)),
                ('body', ckeditor_uploader.fields.RichTextUploadingField(blank=True)),
                ('author', models.CharField(max_length=128)),
                ('os_id', models.ForeignKey(to='map.OS_Feature', on_delete=models.SET_NULL)),
            ],
        ),
    ]
