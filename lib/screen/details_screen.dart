import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ynot_machine_test/model/post_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Posts post = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Added spacing for neat layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Left alignment
          children: [
            Text(
              "Title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("${post.title}"),
            SizedBox(height: 12),

            Text(
              "Body:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("${post.body}"),
            SizedBox(height: 12),

            Text(
              "User ID:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(post.userId.toString()),
            SizedBox(height: 12),

            Text(
              "Post ID:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(post.id.toString()),
          ],
        ),
      ),
    );
  }
}
