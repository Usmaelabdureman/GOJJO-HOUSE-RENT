import 'package:flutter/material.dart';

class UserPostList extends StatelessWidget {
  const UserPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Post"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Current user posts here"),
      ),
    );
  }
}
