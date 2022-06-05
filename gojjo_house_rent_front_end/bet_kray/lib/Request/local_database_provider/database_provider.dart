import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../models/req_models.dart';

class DatabaseProvider {
  static Database? _database;
  static final DatabaseProvider provider = DatabaseProvider._init();
  DatabaseProvider._init();
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  // Create the database and the request table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'request_db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE request('
          'id INTEGER PRIMARY KEY,'
          'city TEXT,'
          'subcity TEXT,'
          'description TEXT,'
          ')');
    });
  }

  //insert reqeust to database
  Future<int> createRequest(UserRequest request) async {
    await deleteAllRequest();
    final db = await database;

    final response = await db!.insert('request', request.toJson());

    return response;
  }

  // get all userReqeust
  Future<List<UserRequest>> getAllRequest() async {
    final db = await database;
    final response = await db!.rawQuery("SELECT * FROM REQUEST");

    List<UserRequest> list = response.isNotEmpty
        ? response.map((c) => UserRequest.fromJson(c)).toList()
        : [];
    return list;
  }

//get a request by Id
  Future<UserRequest> getequestRBId(int id) async {
    final db = await database;
    var result = await db!.query("request", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? UserRequest.fromMap(result.first) : Null;
  }

//get update user request
  Future<int> UpdateUserRequest(UserRequest request) async {
    final db = await provider.database;

    var result = await db!.update("request", request.toJson(),
        where: "id = ?", whereArgs: [request.id]);

    return result;
  }

  //remove all requests
  Future<int> deleteAllRequest() async {
    final data = await database;
    final response = await data!.rawDelete('DELETE FROM request');

    return response;
  }

//delete by Id
  Future<int> deleteRequest(int id) async {
    final db = await provider.database;
    var result = db!.delete("request", where: "id = ?", whereArgs: [id]);

    return result;
  }
}
