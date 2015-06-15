from django.db import models
from django.utils.text import slugify

# Create your models here.
class Page(models.Model):
    page_title = models.CharField(max_length=200)
    page_content = models.TextField()
    creation_date = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
    is_main_page = models.BooleanField(default=False)
    page_slug = models.CharField(max_length=200, blank=True)
    def get_title(self):
        return self.page_title
    def get_content(self):
        return self.page_content
    def __unicode__(self):
        return self.page_title
    def save(self, *args, **kwargs):
        self.page_slug = slugify(self.page_title)
        super(Page, self).save(*args, **kwargs)

class Navigation(models.Model):
    link_page = models.ForeignKey(Page)
    link_label = models.CharField(max_length=200)
    link_order = models.IntegerField()
    def __unicode__(self):
        return self.link_label

class Appointment(models.Model):
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    validated = models.BooleanField(default=False)