# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
        ('vitrine', '0003_page_page_template'),
    ]

    operations = [
        migrations.AddField(
            model_name='page',
            name='page_html',
            field=tinymce.models.HTMLField(null=True),
            preserve_default=True,
        ),
    ]
