# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('article_title', models.CharField(max_length=200)),
                ('article_content', models.TextField()),
                ('creation_date', models.DateTimeField(auto_now_add=True)),
                ('last_modified', models.DateTimeField(auto_now=True)),
                ('is_main_page', models.BooleanField(default=False)),
                ('article_slug', models.CharField(max_length=200, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
