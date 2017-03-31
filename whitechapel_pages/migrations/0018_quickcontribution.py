# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('whitechapel_pages', '0017_page_building_of_the_week'),
    ]

    operations = [
        migrations.CreateModel(
            name='QuickContribution',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=140)),
                ('email', models.EmailField(max_length=254)),
                ('text', models.TextField()),
                ('location', models.CharField(max_length=200, blank=True)),
                ('date_submitted', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
