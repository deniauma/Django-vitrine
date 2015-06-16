from django.shortcuts import render
from django.views import generic
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from vitrine.models import Page, Navigation, Appointment, Label

def HomePage(request):
    page = Page.objects.filter(is_main_page=True).first()
    return HttpResponseRedirect(reverse('vitrine:page', args=(page.page_slug,)))


class PageView(generic.DetailView):
    model = Page
    slug_field = 'page_slug'
    slug_url_kwarg = 'page_slug'

    def get_template_names(self):
        return self.object.page_template

    def get_context_data(self, **kwargs):
        context = super(PageView, self).get_context_data(**kwargs)

        #retrieve all menu links and add them to context
        navigation_links = Navigation.objects.all().order_by('link_order')
        context['navigation'] = navigation_links

        #retrieve all page labels and add them to context
        page_labels = Label.objects.filter(label_page=self.object.id).order_by('label_place')
        label_title = [l for l in page_labels if l.label_place == 'T']
        label_contents = [l for l in page_labels if l.label_place[0] == 'C']
        context_labels = {}
        if label_title:
            context_labels['title'] = label_title[0]
        context_labels['content'] = label_contents
        context['labels'] = context_labels

        #retrieve all appointments and add them to context
        schedule_events = Appointment.objects.filter(validated=True)
        schedule_events_momentjs = []
        for event in schedule_events:
            #'2015-02-12T20:00:00'
            start_date = event.start_date.strftime('%Y-%m-%dT%H:%M:%S')
            end_date = event.end_date.strftime('%Y-%m-%dT%H:%M:%S')
            title = "Rendez-vous"
            schedule_events_momentjs.append({'start_date': start_date, 'end_date': end_date, 'title': title})
        context['schedule_events'] = schedule_events_momentjs
        return context
