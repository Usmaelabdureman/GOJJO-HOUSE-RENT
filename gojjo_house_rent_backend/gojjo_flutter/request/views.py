from django.shortcuts import render

from rest_framework import generics
from .models import Request
from posts.permissions import IsAuthorOrReadOnly
from .serializers import RequestSerializer
from rest_framework import generics, permissions
from rest_framework.permissions import IsAuthenticated


class RequestList(generics.ListCreateAPIView):
    def perform_create(self, serializer):
        serializer.save(author=self.request.user)
    permission_classes = [IsAuthenticated]
    queryset = Request.objects.all()
    serializer_class = RequestSerializer

class RequestDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthorOrReadOnly]
    queryset = Request.objects.all()
    serializer_class = RequestSerializer



class UserRequestList(generics.ListCreateAPIView):
    serializer_class = RequestSerializer
    def get_queryset(self):
        user = self.request.user
        if user:    
           return Request.objects.filter(author= user)
        return "you are not authenticated"


