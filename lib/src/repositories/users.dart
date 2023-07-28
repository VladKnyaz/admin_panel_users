import 'package:dio/dio.dart';

final dio = Dio();

class UsersApi {
  static const String _baseUrl = "https://rest-full-for-edu.onrender.com/api";
  static Future getUsers() async {
    try {
      final response = await dio.get(_baseUrl + '/read');
      return response;
    } catch (e) {
      print(e);
    }
  }

  static Future getUserById(int id) async {
    try {
      final response = await dio.get('$_baseUrl/read/$id');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static Future deleteUser(int id) async {
    try {
      final response = await dio.delete('$_baseUrl/delete/$id');
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static void createUser() async {
    final response = await dio.post('$_baseUrl/create', data: {
      "info": {"name": "Name", "login": "login", "password": "asdfghbnm0"}
    });
  }

  static Future<Response> updateUser(
      int id, String name, String login, String password) async {
    final response = await dio.put('$_baseUrl/update/$id', data: {
      "info": {"name": name, "login": login, "password": password}
    });
    return response;
  }
}
