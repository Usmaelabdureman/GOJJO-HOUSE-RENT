import 'package:bet_kray/User/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        if (state is OperationSuccess) {
          final users = state.users;
          return Scaffold(
            body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = users.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${user.first_name} ${user.middle_name}'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${user.email}'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RaisedButton(
                              color: Colors.red,
                              onPressed: () {
                                BlocProvider.of<UserBloc>(context)
                                    .add(DeleteUser(user.id));
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("delete",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ]),
                    ),
                  );
                }),
          );
        }

        if (state is OperationFailed) {
          return Text("Could not load user lists.");
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
