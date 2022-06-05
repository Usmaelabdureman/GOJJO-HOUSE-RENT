import 'package:bet_kray/Request/Screens/add_request.dart';
import 'package:bet_kray/Request/Screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/bloc.dart';

class RequestList extends StatelessWidget {
  const RequestList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Requests'),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<RequestBloc, RequestState>(
        builder: (_, state) {
          if (state is UserRequestOperationFailure) {
            return const Text('Could load the requests.');
          }

          if (state is UserRequestOperationSuccess) {
            final requests = state.requests;

            return ListView.builder(
                itemCount: requests.length,
                itemBuilder: (_, idx) {
                  return Center(
                    child: Container(
                      width: 325,
                      child: Card(
                        margin: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "City: ",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        letterSpacing: 1.02),
                                  ),
                                  Text('${requests.elementAt(idx).city}')
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text(
                                    "Subcity: ",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        letterSpacing: 1.02),
                                  ),
                                  Text('${requests.elementAt(idx).subcity}')
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text(
                                    "BedRoom Number: ",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        letterSpacing: 1.02),
                                  ),
                                  Text('${requests.elementAt(idx).bedroom}')
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Description: ",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    letterSpacing: 1.02),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                        '${requests.elementAt(idx).description}'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }

          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        onPressed: () => context.go('/user_request_list'),
        child: Icon(Icons.add),
      ),
    );
  }
}
