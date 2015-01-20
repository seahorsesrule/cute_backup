from django.db import models


# Each cat has one database entry (although users can upload multiple photos of their cat)
class Cat (models.Model):
    name = models.CharField(max_length=150)
    created = models.DateTimeField(auto_now_add=True)
    
    def __unicode__(self):
        return self.name

# This is the model for individual cat photo submissions
class CatData(models.Model):
    cat = models.ForeignKey(Cat, related_name="data")
    photo = models.ImageField(upload_to='catimages/')
    story = models.TextField(blank=True)
    created = models.DateTimeField(auto_now_add=True)

# Database items affected by a user's cuteness vote
class Vote(models.Model):
    cat_data = models.OneToOneField(CatData, related_name='vote')
    cuteness_sum = models.PositiveIntegerField(default=0)
    num_votes = models.IntegerField(default=0)

    # Calculates average cuteness, which is displayed after a user votes
    @property
    def avg_cuteness(self):
        ave = self.cuteness_sum / float(self.num_votes)
        return "%.2f" % ave