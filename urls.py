from django.conf.urls import patterns, url

from vitrine import views

urlpatterns = patterns('',
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<page_slug>[\w-]+)/$', views.PageView.as_view(), name='page'),
)
