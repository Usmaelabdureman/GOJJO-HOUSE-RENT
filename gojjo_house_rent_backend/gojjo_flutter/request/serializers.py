from requests import request
from rest_framework import serializers
from .models import Request


class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = [
            'id',
            'city',
            'subcity',
            'description',
            'bedroom'
        ]
