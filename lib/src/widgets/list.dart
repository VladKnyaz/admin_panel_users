import 'package:flutter/material.dart';
import 'package:users_app/src/repositories/users.dart';
import 'package:users_app/src/services/user.service.dart';
import 'package:users_app/src/widgets/person.dart';

class ListComponent extends StatefulWidget {
  ListComponent({super.key});

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  var listUsers;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var resp = await UserService.getUsers();
    setState(() {
      listUsers = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: listUsers == null ? 0 : listUsers.length,
      itemBuilder: (BuildContext context, index) {
        return PersonComponent(
            listUsers[index]["id"], listUsers[index], getData);
      },
    ));
  }
}
