import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/posts_controller.dart';

class ApiCallingScreen extends StatefulWidget {
  const ApiCallingScreen({super.key});

  @override
  State<ApiCallingScreen> createState() => _ApiCallingScreenState();
}

class _ApiCallingScreenState extends State<ApiCallingScreen> {
  final PostsController postsController = Get.put(PostsController());

  @override
  void initState() {
    super.initState();
    postsController.fetchPosts();
  }

  Future<void> _onRefresh() async {
    await postsController.fetchPosts();
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      appBar: AppBar(title: const Text('Data From API'), centerTitle: true),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.grey,
        strokeWidth: 3.0,
        onRefresh: _onRefresh,
        child: Obx(() {
          if (postsController.isLoading.value) {
            // Still use Center because user can't pull while loading
            return const Center(child: CircularProgressIndicator());
          }

          final hasError = postsController.error.value.isNotEmpty;
          final postList = postsController.posts;

          if (hasError && postList.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Text(
                      postsController.error.value,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          }

          if (postList.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: Text(
                      "No posts available.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: postList.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final post = postList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      post.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      post.body,
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: Text(
                      'ID: ${post.id}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
