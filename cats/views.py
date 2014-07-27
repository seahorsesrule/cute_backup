import json

from django.core.urlresolvers import reverse
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect

from cats.models import Cat, CatData, Vote
from cats.forms import CatDataForm, VoteForm


def index(request):
    random_catdata = CatData.objects.order_by("?")[0]
    return render(request,
                'cats/index.html',
                {'random_catdata': random_catdata})

def submit(request):
    if request.method == 'POST':
        form = CatDataForm(request.POST, request.FILES)
        if form.is_valid():
            cat, cat_data = form.save()
            return HttpResponseRedirect(reverse('display_cat_data',
                                                args=(cat.name, cat.id, cat_data.id)))
    else:
        form = CatDataForm()
    return render(request,
                  'cats/submit.html',
                  {'form' : form}
    )

def display_cat(request, cat_id):
    cat = Cat.objects.get(id=cat_id)
    return render(request,
                  'cats/display.html',
                  {'cat': cat})

def display_cat_data(request, cat_id, cat_data_id):
    cat = Cat.objects.get(id=cat_id)
    cat_data = CatData.objects.get(cat=cat, id=cat_data_id)
    return render(request,
                  'cats/display_data.html',
                  {
                    'cat': cat,
                    'cat_data': cat_data
                  })

def vote(request, cat_data_id):
    catdata = CatData.objects.get(id=cat_data_id)
    if request.method == 'POST':
        form = VoteForm(request.POST)
        if form.is_valid():
            if not hasattr(catdata, 'vote'):
                Vote.objects.create(cat_data=catdata)
            cat_vote = catdata.vote
            cat_vote.cuteness_sum += form.cleaned_data.get('vote')
            cat_vote.num_votes += 1
            cat_vote.save()
            response_data = {'average': cat_vote.avg_cuteness}
            return HttpResponse(json.dumps(response_data), content_type="application/json")

def search(request):
    if 'idsearch' in request.GET:
        idsearch = request.GET['idsearch']
        cat = Cat.objects.get(id=idsearch)
        return HttpResponseRedirect(reverse('display_cat',
                                            args=(cat.name, cat.id)))
    elif 'namesearch' in request.GET:
        namesearch = request.GET['namesearch']
        cats = Cat.objects.filter(name__iexact=namesearch)
        response_data = []
        for cat in cats:
            catdata = CatData.objects.filter(cat=cat).latest('created')
            response_data.append({
                'photo_url': catdata.photo.url,
                'url': reverse('display_cat', args=(cat.name, cat.id)),
                'id': cat.id,
                'name': cat.name
            })
        return HttpResponse(json.dumps(response_data), content_type="application/json")
        
    return render(request,
                  'cats/search.html',
                  )

