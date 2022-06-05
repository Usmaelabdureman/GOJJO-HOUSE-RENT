import 'package:bet_kray/Post/screens/post_add.dart';
import 'package:bet_kray/User/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Login/bloc/bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 112, 80, 67),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 55,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "username: user",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "email: user@user.com",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.1),
                          )
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () => BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is UserLoginSuccessState) {
                              context.go('/user_profile');
                            } else if (state is AdminLoginSuccesState) {
                              context.go('/admin_profile');
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    title: const Text("Home"),
                    leading: const Icon(Icons.home),
                    onTap: () => context.go('/')),
                ListTile(
                    title: const Text("Request list"),
                    leading: const Icon(Icons.format_list_bulleted),
                    onTap: () => context.go('/request_list')),
                ListTile(
                    title: const Text("Add post"),
                    leading: const Icon(Icons.add),
                    onTap: () => context.go('/user_posts/add_post')),
                ListTile(
                  title: const Text("Add request"),
                  leading: const Icon(Icons.add),
                  onTap: () => context.go('/request_list/add_request'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
