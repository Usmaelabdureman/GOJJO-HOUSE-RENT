
from email.mime import image
from email.policy import default
from django.db import models
from django.conf import settings
from gojjo import settings
from django.utils.translation import gettext_lazy as _



def upload_to(instance,filename):
    return 'posts/{filename}'.format(filename=filename)


    
class Post(models.Model):
    city = models.CharField(max_length=100)
    subcity = models.CharField(max_length=100)
    price = models.FloatField()
    description = models.TextField(null=True)
    image = models.ImageField(_("Image"),upload_to=upload_to,default='posts/default.jpg')
    created = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    author = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)

    class Meta:
        ordering = ('-created',)
        
    def __str__(self):
        return self.city