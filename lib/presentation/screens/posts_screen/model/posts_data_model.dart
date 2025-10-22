import 'dart:convert';

List<PostsData> postsDataFromJson(String str) =>
    List<PostsData>.from(json.decode(str).map((x) => PostsData.fromJson(x)));

String postsDataToJson(List<PostsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsData {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostsData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
