import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ynot_machine_test/model/post_model.dart';

class ApiService extends GetxController {
  final Dio dio = Dio();

  var isloding = false.obs;
  var posts = <Posts>[].obs;
  var searchpost = <Posts>[].obs;

  final baseurl = "https://jsonplaceholder.typicode.com/posts";

  Future<void> getdata() async {
    try {
      isloding.value = true;

      final response = await dio.get(baseurl);
      List<Posts> getpost = (response.data as List)
          .map((json) => Posts.fromJson(json))
          .toList();

      posts.assignAll(getpost);
      searchpost.assignAll(getpost);
    } catch (e) {
      Get.snackbar("Error", "Failed to load data");
    } finally {
      isloding.value = false;
    }
  }

  // 🔥 FIXED SEARCH FUNCTION
  void search(String query) {
    if (query.isEmpty) {
      searchpost.assignAll(posts);
    } else {
      searchpost.assignAll(
        posts
            .where(
              (post) => (post.title ?? "").toLowerCase().contains(
                query.toLowerCase(),
              ),
            )
            .toList(),
      );
    }
  }
}
