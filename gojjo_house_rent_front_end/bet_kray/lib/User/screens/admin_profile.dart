import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/user.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your profile"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Full Name: ",
                            style: TextStyle(),
                          ),
                          Text(
                              "Full Name: username"),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const  [
                          Text(
                            "Email: ",
                            style: TextStyle(),
                          ),
                          Text("Email: user@email.com"),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit profile"),
              onTap: () => context.go('/admin_profile/edit_profile'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Change password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Your posts"),
              onTap: () => context.go('/user_posts/current_user_posts'),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Your requests"),
              onTap: () => context.go('/user_request_list'),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("manage app"),
              onTap: () => context.go('/admin_screen'),
            ),
          ],
        ),
      ),
    );
  }
}
