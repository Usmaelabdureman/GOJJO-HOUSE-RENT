import 'package:bet_kray/Login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Post/screens/index.dart';
import '../widget/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gojjo"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
        actions: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(logoutButtonPressed());
            },
            child: const Text("logout"),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (index == 0) {
            context.go('/');
          } else if (index == 1) {
            context.go('/request_list');
          } else if (index == 2) {
            context.go('/user_profile');
          }
        },
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: "request",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
