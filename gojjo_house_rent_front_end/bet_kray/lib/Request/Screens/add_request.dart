import 'package:bet_kray/Request/bloc/bloc.dart';
import 'package:bet_kray/Request/models/req_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddRequest extends StatelessWidget {
  AddRequest({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _subcityController = TextEditingController();
  final _bedroomNumberController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Request"),
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
                  controller: _bedroomNumberController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'bedroom number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter bedroom number";
                    }

                    final validBedroomNumber = RegExp('^[0-9]');
                    final isValid = validBedroomNumber.hasMatch(value);

                    return isValid ? null : 'Please enter valid bedroom number';
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
                      // final form = _formKey.currentState;
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<RequestBloc>(context)
                            .add(RequestCreate(UserRequest(
                          id: 0,
                          city: _cityController.text,
                          subcity: _subcityController.text,
                          bedroom: int.parse(_bedroomNumberController.text),
                          description: _descriptionController.text,
                        )));
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
