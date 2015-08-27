# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0012_auto_20150816_0912'),
    ]

    operations = [
        migrations.AlterField(
            model_name='appointment',
            name='validated',
            field=models.BooleanField(default=True),
            preserve_default=True,
        ),
    ]
