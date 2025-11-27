import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:ynot_machine_test/screen/details_screen.dart';
import 'package:ynot_machine_test/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = Get.put(ApiService());
  @override
  Widget build(BuildContext context) {
    apiService.getdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed("/login");
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          //search....................................
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => apiService.search(value),
              decoration: InputDecoration(
                hintText: "search.......",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (apiService.isloding.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (apiService.searchpost.isEmpty) {
                return const Center(child: Text("No data found"));
              }
              return ListView.builder(
                itemCount: apiService.searchpost.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = apiService.searchpost[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text(post.id.toString())),
                      title: Text(
                        post.title ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(post.body ?? ""),
                      onTap: () =>
                          Get.to(() => DetailsScreen(), arguments: post),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
