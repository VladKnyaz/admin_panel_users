import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:users_app/src/repositories/users.dart';

class UserService {
  static void deleteUser(int id) async {
    await UsersApi.deleteUser(id);
  }

  static void updateUser(int id,
      {required String name,
      required String login,
      required String password}) async {
    UsersApi.updateUser(id);
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
