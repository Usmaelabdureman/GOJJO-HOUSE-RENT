from django.urls import path
from .views import PostList,PostDetail,UserPostList, UserPostListDetail


urlpatterns = [
path('<int:pk>/', PostDetail.as_view()),
path('', PostList.as_view()),
path('userposts/',UserPostList.as_view()),
path('userposts/<int:pk>/',UserPostListDetail.as_view())
]