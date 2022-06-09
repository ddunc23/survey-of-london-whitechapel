# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import djgeojson.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0028_auto_20160223_1709'),
    ]

    operations = [
        migrations.CreateModel(
            name='OS_Feature',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('os_id', models.CharField(max_length=128)),
                ('geom', djgeojson.fields.PolygonField()),
                ('address', models.CharField(max_length=255)),
                ('count', models.PositiveSmallIntegerField(default=0)),
                ('categories', models.ManyToManyField(to='map.Category', blank=True)),
                ('neighbourhood', models.ForeignKey(to='map.Neighbourhood', null=True, on_delete=models.SET_NULL)),
            ],
        ),
        migrations.RemoveField(
            model_name='feature',
            name='categories',
        ),
        migrations.RemoveField(
            model_name='feature',
            name='neighbourhood',
        ),
        migrations.AlterField(
            model_name='document',
            name='os_id',
            field=models.ForeignKey(to='map.OS_Feature', on_delete=models.SET_NULL),
        ),
        migrations.AlterField(
            model_name='story',
            name='os_id',
            field=models.ForeignKey(blank=True, to='map.OS_Feature', null=True, on_delete=models.SET_NULL),
        ),
        migrations.DeleteModel(
            name='Feature',
        ),
    ]
