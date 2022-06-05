import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import '../models/post.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'post_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Post('
          'id INTEGER PRIMARY KEY,'
          'city TEXT,'
          'subcity TEXT,'
          'price TEXT,'
          'description TEXT'
          ')');
    });
  }

  createPost(Post newPost) async {
    final db = await database;
    final res = await db!.insert('posts', newPost.toJson());

    return res;
  }

  Future<int> deleteAllPosts() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM POSTS');

    return res;
  }
  Future<Post> getPostById(int id ) async{
  final db = await database; 
      var result = await db!.query("Post", where: "id = ", whereArgs: [id]); 
      return result.isNotEmpty ? Post.fromMap(result.first) : Null; 
   } 
//get update posts
Future<int> UpdateUserPost(Post post) async {
    final db = await DBProvider.database;

    var result = await db!.update("request",  post.toJson(), 
   where: "id = ?", whereArgs: [post.id]);
   
    return result; 
}

  Future<List<Post>> getAllPosts() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM POSTS");

    List<Post> list =
        res.isNotEmpty ? res.map((c) => Post.fromJson(c)).toList() : [];

    return list;
  }
}