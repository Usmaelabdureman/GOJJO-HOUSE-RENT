import 'package:bet_kray/Request/bloc/bloc.dart';
import 'package:bet_kray/Request/models/req_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateUserRequest extends StatelessWidget {
  UpdateUserRequest({Key? key, required this.userRequest}) : super(key: key) {
    _cityController.text = userRequest.city;
    _subcityController.text = userRequest.subcity;
    _bedroomNumberController.text = userRequest.bedroom.toString();
    _descriptionController.text = userRequest.description;
  }

  final dynamic userRequest;

  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _subcityController = TextEditingController();
  final _bedroomNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("update Request"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                TextFormField(
                  // initialValue: userRequest.city,
                  controller: _cityController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                    // initialValue: userRequest.subcity,
                    controller: _subcityController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Sub-City',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter subcity";
                      }

                      return null;
                    }),
                const SizedBox(height: 10.0),
                TextFormField(
                  // initialValue: userRequest.bedroom.toString(),
                  controller: _bedroomNumberController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'bedroom number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter bedroom number";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter description";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(46, 229, 218, 0.94),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15.0),
                      child: const Text(
                        "submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<RequestBloc>(context).add(RequestUpdate(
                            userRequest.id,
                            UserRequest(
                              id: userRequest.id,
                              city: _cityController.text,
                              subcity: _subcityController.text,
                              bedroom: int.parse(_bedroomNumberController.text),
                              description: _descriptionController.text,
                            )));
                        context.pop();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
