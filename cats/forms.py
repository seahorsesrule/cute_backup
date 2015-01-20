from django import forms
from cats.models import Cat, CatData, Vote


# Users submit cat photos using this form
class CatDataForm(forms.Form):
    catname = forms.CharField(max_length=150, required=True)
    photo = forms.FileField(required=True)
    story = forms.CharField()
    
    def save(self):
        cat, is_newcat = Cat.objects.get_or_create(name=self.cleaned_data['catname'])
        catdata = CatData(cat=cat, story=self.cleaned_data['story'])
        catdata.save()
        catdata.photo.save('%s.jpg' % catdata.id, self.cleaned_data['photo'])
        catdata.save()
        return (cat, catdata)
        
# Users vote with this form
class VoteForm(forms.Form):
    vote = forms.IntegerField()

# Users search for a cat with this form
class SearchForm(forms.Form):
    namesearch = forms.CharField(max_length=150)
    idsearch = forms.IntegerField()
 