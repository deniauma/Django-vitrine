from django.conf.urls import patterns, url

from vitrine import views

urlpatterns = patterns('',
    url(r'^$', views.HomePage, name='homepage'),
    url(r'^prendre-rendezvous/', views.create_appointment, name='create_appointment'),
    url(r'^envoyer-email/', views.send_email, name='send_email'),
    url(r'^(?P<page_slug>[\w-]+)/$', views.PageView.as_view(), name='page'),
)
