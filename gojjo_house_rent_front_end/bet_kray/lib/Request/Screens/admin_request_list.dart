import 'package:bet_kray/Request/Screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class AdminPageRequestList extends StatelessWidget {
  const AdminPageRequestList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
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
                  final userRequest = requests.elementAt(idx);
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
                                  Text('${userRequest.city}')
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
                                  Text('${userRequest.subcity}')
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
                                  Text('${userRequest.bedroom}')
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
                                        '${userRequest.description}'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RaisedButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      BlocProvider.of<RequestBloc>(context).add(
                                          RequestDelete(
                                              userRequest.id));
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
