import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import '../../presentation/screens/posts_screen/model/posts_data_model.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    userId INTEGER,
    title TEXT,
    body TEXT
  )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'aoffahad',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        print("...creating a table...");
        await createTables(database);
      },
    );
  }

  Future<void> insertPost(List<PostsData> postData) async {
    try {
      final db = await SQLHelper.db();

      await db.delete('items');

      Batch batch = db.batch();

      for (var post in postData) {
        batch.insert('items', {
          'userId': post.userId,
          'title': post.title,
          'body': post.body,
        });
      }

      // Commit the batch
      await batch.commit(noResult: true);
      print("Posts inserted successfully");
    } catch (e) {
      print("Error inserting posts: $e");
    }
  }

  Future<List<PostsData>> getPosts() async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('items');
    return List.generate(maps.length, (i) {
      return PostsData(
        id: maps[i]['id'],
        userId: maps[i]['userId'],
        title: maps[i]['title'],
        body: maps[i]['body'],
      );
    });
  }
}
