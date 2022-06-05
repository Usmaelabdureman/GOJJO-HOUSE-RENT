import 'package:bet_kray/Request/Screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/bloc.dart';

class UserRequestList extends StatelessWidget {
  static const routeName = 'userRequests';
  const UserRequestList({Key? key}) : super(key: key);
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
            return const Text('Could not do request operation');
          }

          if (state is UserRequestOperationSuccess) {
            final requests = state.requests;
            print(requests);

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
                              Row(
                                children: [
                                  Expanded(
                                    child: RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        BlocProvider.of<RequestBloc>(context)
                                            .add(RequestDelete(
                                                requests.elementAt(idx).id));
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                UserRequestList.routeName,
                                                (route) => false);
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
                                  ),
                                  Expanded(
                                    child: RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () => context.go(
                                          '/user_request_list/edit_request',
                                          extra: requests.elementAt(idx)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text("edit",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context).pushNamed(
      //     AddUpdateRequest.routeName,
      //     arguments: RequestArgument(edit: false),
      //   ),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
