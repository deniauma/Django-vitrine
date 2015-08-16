from django.db import models
from django.utils.text import slugify
from tinymce.models import HTMLField

# Create your models here.
class Page(models.Model):
    page_slug = models.CharField(max_length=200)
    creation_date = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
    is_main_page = models.BooleanField(default=False)
    page_template = models.CharField(max_length=200, default='index.html')
    def __unicode__(self):
        return self.page_slug


class Label(models.Model):
    label_page = models.ForeignKey(Page)
    TITLE = 'T'
    CONTENT_PART1 = 'C1'
    CONTENT_PART2 = 'C2'
    CONTENT_PART3 = 'C3'
    CONTENT_PART4 = 'C4'
    CONTENT_PART5 = 'C5'
    CONTENT_PART6 = 'C6'
    CONTENT_PART7 = 'C7'
    CONTENT_PART8 = 'C8'
    CONTENT_PART9 = 'C9'
    CONTENT_PART10 = 'C10'
    LABEL_PLACES = (
        (TITLE, 'Title'),
        (CONTENT_PART1, 'Content part 1'),
        (CONTENT_PART2, 'Content part 2'),
        (CONTENT_PART3, 'Content part 3'),
        (CONTENT_PART4, 'Content part 4'),
        (CONTENT_PART5, 'Content part 5'),
        (CONTENT_PART6, 'Content part 6'),
        (CONTENT_PART7, 'Content part 7'),
        (CONTENT_PART8, 'Content part 8'),
        (CONTENT_PART9, 'Content part 9'),
        (CONTENT_PART10, 'Content part 10'),
    )
    label_place = models.CharField(max_length=20, choices=LABEL_PLACES)
    label_text = HTMLField()


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
    last_name = models.CharField(max_length=50)
    first_name = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    details = models.TextField(blank=True)


class ClosingDay(models.Model):
    date = models.DateField()
    title = models.CharField(max_length=20)