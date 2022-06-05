import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Managing Screen"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Admin screen"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/admin_profile/admin_screen/userlist');
            },
            child: Text("Users List"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/admin_profile/admin_screen/postlist');
            },
            child: Text("Posts List"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/admin_profile/admin_screen/requestlist');
            },
            child: Text("Requests List"),
          ),
        ],
      ),
    );
  }
}
