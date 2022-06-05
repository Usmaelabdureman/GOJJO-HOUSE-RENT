from rest_framework import generics
from posts.models import Post
from .serializers import PostSerializer
from rest_framework import generics, permissions
from .permissions import IsAuthorOrReadOnly
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAdminUser

class PostList(generics.ListCreateAPIView):
    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class PostDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthorOrReadOnly]
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class UserPostList(generics.ListCreateAPIView):
    serializer_class = PostSerializer
    def get_queryset(self):
        user = self.request.user
        if user:    
           return Post.objects.filter(author= user)
        else:
            return "you are not authenticated" 
             
class UserPostListDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = PostSerializer
    def get_queryset(self):
        user = self.request.user
        if user:    
           return Post.objects.filter(author= user)
        else:
            return "you are not authenticated"
        




