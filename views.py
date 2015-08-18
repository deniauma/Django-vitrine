from django.shortcuts import render
from django.views import generic
from django.http import HttpResponseRedirect, JsonResponse
from django.core.urlresolvers import reverse
from vitrine.models import Page, Navigation, Appointment, Label, ClosingDay
from vitrine.forms import AppointmentForm, ContactForm
from datetime import timedelta

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

        if self.object.page_slug == "contact":
            contactForm = ContactForm()
            context['contactForm'] = contactForm

        if self.object.page_slug == "seances-et-tarifs":
            #retrieve all appointments, closing days and add them to context
            schedule_events = Appointment.objects.filter(validated=True)
            schedule_events_momentjs = []
            for event in schedule_events:
                #'2015-02-12T20:00:00'
                start_date = event.start_date.strftime('%Y-%m-%dT%H:%M:%S')
                end_date = event.end_date.strftime('%Y-%m-%dT%H:%M:%S')
                title = "Rendez-vous"
                schedule_events_momentjs.append({'start_date': start_date, 'end_date': end_date, 'title': title, 'color': 'green'})
            for day in ClosingDay.objects.all():
                start_date = day.date.strftime('%Y-%m-%dT08:00:00')
                end_date = day.date.strftime('%Y-%m-%dT20:00:00')
                title = day.title
                schedule_events_momentjs.append({'start_date': start_date, 'end_date': end_date, 'title': title, 'color': 'red'})
            context['schedule_events'] = schedule_events_momentjs
            form = AppointmentForm()
            context['form'] = form

        return context


def create_appointment(request):
    if request.method == 'POST':
        form = AppointmentForm(request.POST)
        if form.is_valid():
            date = form.cleaned_data['appointment_date']
            last_name = form.cleaned_data['appointment_lastName']
            first_name = form.cleaned_data['appointment_firstName']
            email = form.cleaned_data['appointment_email']
            phone = form.cleaned_data['appointment_phone']
            details = form.cleaned_data['appointment_details']
            start_date = date
            end_date = date + timedelta(hours=1)
            appointment = Appointment(start_date = start_date, end_date = end_date, last_name = last_name, first_name = first_name, email = email, phone = phone, details = details)
            appointment.save()

            return JsonResponse({'created':'yes'})

        else:
            return JsonResponse(form.errors.as_json(), safe=False)

    else:
        return JsonResponse({'created':'no', 'error':'not a POST request'})


def send_email(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['contact_name']
            email = form.cleaned_data['contact_email']
            message = form.cleaned_data['contact_message']

            return render(request, 'form-result.html', {
                'form': form,
                'status': "success",
            })

        else:
            return render(request, 'form-result.html', {
                'form': form,
                'status': "error",
                'error_message': 'Le formulaire contient des erreurs!',
            })

    else:
        return render(request, 'form-result.html', {
            'form': form,
            'status': "error",
            'error_message': 'Une erreur technique est survenue!',
        })