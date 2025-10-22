import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/local_database_data_handler_controller.dart';

class LocalDatabaseScreen extends StatefulWidget {
  const LocalDatabaseScreen({super.key});

  @override
  State<LocalDatabaseScreen> createState() => _LocalDatabaseScreenState();
}

class _LocalDatabaseScreenState extends State<LocalDatabaseScreen> {
  final LocalPostsController localPostsController = Get.put(
    LocalPostsController(),
  );

  @override
  void initState() {
    super.initState();
    localPostsController.fetchLocalPosts();
  }

  Future<void> _onRefresh() async {
    await localPostsController.fetchLocalPosts();
    await Future.delayed(Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data From Local Database")),
      backgroundColor: const Color(0xff11161f),
      body: Obx(() {
        if (localPostsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (localPostsController.error.value.isNotEmpty) {
          return Center(
            child: Text(
              "Error: ${localPostsController.error.value}",
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
          );
        }
        final posts = localPostsController.posts;
        if (posts.isEmpty) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: Text(
                    "No posts available.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            itemCount: posts.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post.body,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
