import 'package:get/get.dart';

import '../../../../core/local_database/posts_local_database.dart';
import '../model/posts_data_model.dart';

class LocalPostsController extends GetxController {
  final RxList<PostsData> posts = <PostsData>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  Future<void> fetchLocalPosts() async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await SQLHelper().getPosts();
      posts.assignAll(result);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
