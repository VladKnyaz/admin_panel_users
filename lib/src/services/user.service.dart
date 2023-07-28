import 'package:dio/dio.dart';
import 'package:users_app/src/repositories/users.dart';

class UserService {
  static void deleteUser(int id) async {
    await UsersApi.deleteUser(id);
  }

  static Future updateUser(int id,
      {required String name,
      required String login,
      required String password}) async {
    var result = null;
    await UsersApi.updateUser(id, name, login, password).then((res) {
      result = res;
    });
    return result;
  }

  static Future<List?> getUsers() async {
    Response response = await UsersApi.getUsers();
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
