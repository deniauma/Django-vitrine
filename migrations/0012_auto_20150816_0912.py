# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0011_auto_20150816_0902'),
    ]

    operations = [
        migrations.AlterField(
            model_name='page',
            name='page_slug',
            field=models.CharField(max_length=200),
            preserve_default=True,
        ),
    ]
