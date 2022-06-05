// ignore_for_file: unnecessary_string_escapes

import 'package:bet_kray/User/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/user_bloc.dart';
import '../models/user.dart';

class EditUserProfile extends StatelessWidget {
  EditUserProfile({Key? key, required this.user})
      : super(key: key) {
    _emailController.text = user.email;
    _usernameController.text = user.username;
    _firstNameController.text = user.first_name;
    _middleNameController.text = user.middle_name;
  }

  final dynamic user;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit profile",
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[700],
      ),
      body: ListView(
        children: [
          Container(
            height: 150,
            width: double.maxFinite,
            color: Colors.blue[400],
            child: const Center(
              child: Text(
                "Edit your account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontFamily: "karla",
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  Container(
                    width: 275,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      key: Key("email"),
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Enter your email',
                      ),
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return "Email must not be empty";
                        }

                        final validEmail = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
                        final correct = validEmail.hasMatch(email);

                        return correct ? null : "Enter a valid email";
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 275,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      key: Key("first_name"),
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Enter your first name',
                      ),
                      validator: (String? name) {
                        if (name == null || name.isEmpty) {
                          return "first name field must not empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 275,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      key: Key("middle_name"),
                      controller: _middleNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Enter your middle name',
                      ),
                      validator: (String? name) {
                        if (name == null || name.isEmpty) {
                          return "middle name field must not empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      width: 275,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(46, 229, 218, 0.94),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Register",
                        key: Key("register"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<UserBloc>(context).add(UpdateUser(
                          user.id,
                          User(
                          id: 1,
                          email: _emailController.text,
                          username: _usernameController.text,
                          first_name: _firstNameController.text,
                          middle_name: _middleNameController.text,
                        )));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
