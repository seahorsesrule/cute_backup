from django.db import models
from django import forms
from django.forms import ModelForm

class Cat (models.Model):
    name = models.CharField(max_length=150)
    created = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return self.name
    
class CatData(models.Model):
    cat = models.ForeignKey(Cat, related_name="data")
    photo = models.FileField(upload_to='catimages/', blank=True)
    story = models.TextField(blank=True)
    created = models.DateTimeField(auto_now_add=True)
     
class Vote(models.Model):
    cat_data = models.OneToOneField(CatData, related_name='vote')
    cuteness_sum = models.PositiveIntegerField(default=0)
    num_votes = models.IntegerField(default=0)
    
    @property
    def avg_cuteness(self):
        ave = self.cuteness_sum / float(self.num_votes)
        return "%.2f" % ave