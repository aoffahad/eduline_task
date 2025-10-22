import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/local_database/posts_local_database.dart';
import '../model/posts_data_model.dart';

class PostsController extends GetxController {
  final RxList<PostsData> posts = <PostsData>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  Future<void> fetchPosts() async {
    isLoading.value = true;
    error.value = '';

    try {
      // Check network connection
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        error.value =
            'No internet connection. Please check your Wi-Fi or data.';
        posts.clear();
        return;
      }

      String endpoint = "https://jsonplaceholder.typicode.com/posts";
      http.Response responses = await http.get(Uri.parse(endpoint));

      if (responses.statusCode == 200) {
        final List results = jsonDecode(responses.body);
        final postDataConvert =
            results.map((e) => PostsData.fromJson(e)).toList();
        posts.assignAll(postDataConvert);
        await SQLHelper().insertPost(postDataConvert);
      } else {
        error.value =
            'Server error: ${responses.statusCode} - ${responses.reasonPhrase}';
        posts.clear();
      }
    } catch (e) {
      error.value = 'Failed to fetch data. Please try again later.';
      posts.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
