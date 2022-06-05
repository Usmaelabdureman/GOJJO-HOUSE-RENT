import 'package:bet_kray/Post/bloc/bloc.dart';
import 'package:bet_kray/User/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Signup",
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue[700],
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (_, UserState state) {
            if (state is SignUpSuccessFullyCompleted) {
              context.go('/login');
            }
          },
          builder: (_, UserState state) {
            if (state is RegistrationProcessing) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: [
                Container(
                  height: 150,
                  width: double.maxFinite,
                  color: Color.fromARGB(255, 112, 80, 67),
                  child: const Center(
                    child: Text(
                      "Create Account",
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
                              hintText: 'email',
                            ),
                            validator: (String? email) {
                              if (email == null || email.isEmpty) {
                                return "Email must not be empty";
                              }

                              final validEmail =
                                  RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
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
                            key: Key("username"),
                            controller: _usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'username',
                            ),
                            validator: (String? name) {
                              if (name == null || name.isEmpty) {
                                return "username field must not empty";
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
                            key: Key("first_name"),
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'first name',
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
                              hintText: 'middle name',
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
                        Container(
                          width: 275,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            key: Key("password"),
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: 'password',
                            ),
                            obscureText: true,
                            validator: (String? password) {
                              if (password == null || password.isEmpty) {
                                return "Password must not be empty";
                              }

                              final validPassword = password.length >= 6;
                              return validPassword
                                  ? null
                                  : "Password is atleast 6 character";
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
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
                              BlocProvider.of<UserBloc>(context)
                                  .add(CreateUser(User(
                                id: 0,
                                email: _emailController.text,
                                username: _usernameController.text,
                                first_name: _firstNameController.text,
                                middle_name: _middleNameController.text,
                                password: _passwordController.text,
                              )));
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            const SizedBox(width: 16.0),
                            TextButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              child: const Text("signin"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
