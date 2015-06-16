# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0002_auto_20150615_1431'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='page_template',
            field=models.CharField(default=b'index.html', max_length=200),
            preserve_default=True,
        ),
    ]
