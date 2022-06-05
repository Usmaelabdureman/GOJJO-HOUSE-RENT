import 'package:bet_kray/Post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (_, state) {
        if (state is SuccessOperation) {
          final userPosts = state.posts;
          return Scaffold(
            body: ListView.builder(
              itemCount: userPosts.length,
              itemBuilder: (BuildContext context, int index) {
                final userPost = userPosts.elementAt(index);
                return GestureDetector(
                  onTap: () =>
                      context.go('/user_posts/post_update', extra: userPost),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 15.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color.fromARGB(255, 7, 156, 255),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Address: ${userPost.subcity}, ${userPost.city}, Ethiopia",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Price: ${userPost.price} Birr",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 112, 80, 67),
              onPressed: () => context.go('/user_posts/add_post'),
              child: Icon(Icons.add),
            ),
          );
        }

        if (state is FailedOperation) {
          return Text("Could not load post lists.");
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
