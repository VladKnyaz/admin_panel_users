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

  void createUser() {}
  void updateUser(int id) {}
}
