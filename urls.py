from django.conf.urls import patterns, url

from vitrine import views

urlpatterns = patterns('',
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^calendrier/', views.calendar, name='calendar'),
)
