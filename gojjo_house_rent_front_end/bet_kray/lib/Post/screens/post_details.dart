import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final dynamic post;
  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post details",
        ),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              color: Colors.orange,
            ),
          ),
          Positioned(
            top: 280,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: double.maxFinite,
              padding: EdgeInsets.only(right: 16, left: 16, top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address: ${post.subcity} ${post.subcity}, ${post.city}, Ethiopia",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "price: ${post.price} Birr",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Description: ${post.description}",
                    style: const TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

