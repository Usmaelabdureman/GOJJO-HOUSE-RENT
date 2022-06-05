import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/login_bloc.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginBloc? loginBloc;
  @override
  void initState() {
    loginBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Center(
        child: Icon(
      Icons.supervised_user_circle,
      size: 50,
      color: Colors.red,
    ));
    final msg = BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "login",
          key: Key('title'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[700],
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            context.go("/user_posts");
          } else if (state is AdminLoginSuccesState) {
            context.go("/request_list");
          }
        },
        child: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 218, 221, 220),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 210,
                        width: 320,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/house.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("GOJJO APPLICATION",
                          key: Key('gojjo'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 1.1,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 275,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          key: Key('email'),
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Enter your email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        key: Key('box'),
                        height: 10,
                      ),
                      Container(
                        key: const Key('cont'),
                        width: 275,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          key: Key('pass'),
                          controller: password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Enter your password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                          key: const Key('gesture'),
                          child: Container(
                            width: 275,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(46, 229, 218, 0.94),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15.0),
                            child: const Text(
                              "login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                          onTap: () {
                            loginBloc!.add(
                                loginButtonPressed(email.text, password.text));
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        key: Key('row'),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            key: Key('newUser'),
                          ),
                          const SizedBox(width: 16.0),
                          TextButton(
                            key: Key('signbutton'),
                            onPressed: () => context.go('/create_account'),
                            child: const Text(
                              "signup",
                              key: Key('buttonText'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
