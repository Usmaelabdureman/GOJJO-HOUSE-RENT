// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/post_bloc.dart';
import '../models/post.dart';

class UserPostUpdate extends StatelessWidget {
  UserPostUpdate({Key? key, required this.post}) : super(key: key) {
    _cityController.text = post.city;
    _subcityController.text = post.subcity;
    _priceController.text = post.price.toString();
    _descriptionController.text = post.description;
  }

  final dynamic post;

  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _subcityController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Post"),
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
                const Text("Update your posts here!",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'City',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
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
                      if (value != null && value.isEmpty) {
                        return "Please enter subcity";
                      }

                      return null;
                    }),

                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Price',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter price";
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
                    if (value != null && value.isEmpty) {
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
                      BlocProvider.of<PostBloc>(context).add(PostUpdate(
                          post.id,
                          Post(
                            id: post.id,
                            city: _cityController.text,
                            subcity: _subcityController.text,
                            price: int.parse(_priceController.text),
                            description: _descriptionController.text,
                          )));
                      context.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
