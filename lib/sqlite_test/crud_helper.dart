import 'package:test_file/sqlite_test/database_helper.dart';
import 'package:test_file/sqlite_test/user_model.dart';

class CrudHelper {
  static String tableName = 'User';

  static Future<void> createUser(UserModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.insert(tableName, user.toMap());
  }

  static Future<List<UserModel>> getUsers() async{
    var database = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> list = await database!.rawQuery('SELECT * FROM $tableName');

    List<UserModel> users = [];

    for (var element in list) {
      var user = UserModel.fromMap(element);
      users.add(user);
    }
    return users;
  }

  static Future<void> updateUser(UserModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.update(tableName, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  static Future<void> deleteUser(int id) async {
    var datrabase = await DatabaseHelper.instance.database;
    await datrabase!.delete(tableName, where: 'id =?', whereArgs: [id]);
  }
}