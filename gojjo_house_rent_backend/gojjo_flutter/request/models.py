from django.db import models
from django.conf import settings
from gojjo import settings
from django.utils.translation import gettext_lazy as _


class Request(models.Model):
    city = models.CharField(max_length=100)
    subcity = models.CharField(max_length=100)
    bedroom = models.IntegerField()
    description = models.TextField()
    author = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-created',)

    def __str__(self):
        return self.city