import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/login_bloc.dart';


class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {

  LoginBloc? loginBloc;
  @override

  void initState(){
    loginBloc = BlocProvider.of(context);
    super.initState();
  }

    final logoutButton =ElevatedButton(
    onPressed: (){
      loginBloc!.add(logoutButtonPressed());
    }
    , child: Text("logout")
    );
    return Scaffold(
      body:BlocListener<LoginBloc,LoginState>(
        listener: (context, state){
          if(state is logoutState){
            Navigator.pop(context);
          }
        },
        child: Center(
          child: logoutButton
          ),
      ),
    );
  }
}