import 'dart:async';

import 'package:flutter/material.dart';
import 'package:users_app/src/repositories/users.dart';
import 'package:users_app/src/services/user.service.dart';
import 'package:users_app/src/widgets/person.dart';

class ListComponent extends StatefulWidget {
  String searchText = '';

  ListComponent({required this.searchText, super.key});

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  var listUsers;
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getData();
  }

  @override
  void didUpdateWidget(covariant ListComponent oldWidget) {
    // TODO: implement didUpdateWidget
    getSearch();
    super.didUpdateWidget(oldWidget);
  }

  void getData() async {
    await UserService.getUsers().then((res) {
      setState(() {
        listUsers = res;
      });
    });
    switchLoader(false);
    getSearch();
  }

  // switchLoader({bool isActive = false}) {

  // //   if (isActive) {

  // //   } else {
  // //     print('close');
  // //   }
  // // }

  switchLoader(bool isActive) {
    setState(() {
      isLoading = isActive;
    });
  }

  void getSearch() async {
    if (widget.searchText.isNotEmpty) {
      switchLoader(true);

      print('sss ${widget.searchText}');

      var shadowListUsers;

      await UserService.getUsers().then((res) {
        shadowListUsers = res;
      });
      if (shadowListUsers.length < 0) return;

      List<String> searchTerms = [];
      // ищем из тенеовой/фековой

      for (int i = 0; i < shadowListUsers.length; i++) {
        searchTerms.add(shadowListUsers[i]['info']['name']);
      }

      String query = widget.searchText;

      List<String> listUsersMatchQuery = [];
      for (var name in searchTerms) {
        if (name.toLowerCase().contains(query.toLowerCase())) {
          //возможный ответ
          listUsersMatchQuery.add(name);
        }
      }
      var listUsersQuery = [];

      for (int i = 0; i < shadowListUsers.length; i++) {
        if (listUsersMatchQuery
            .where((name) => name
                .toLowerCase()
                .contains(shadowListUsers[i]['info']['name'].toLowerCase()))
            .isNotEmpty) {
          listUsersQuery.add(shadowListUsers[i]);
        }
      }
      // print(listUsersQuery);
      setState(() {
        listUsers = listUsersQuery;
      });
      switchLoader(false);
    } else if (widget.searchText.isEmpty) {
      switchLoader(true);

      getData();
      switchLoader(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color.fromARGB(255, 20, 18, 25),
                ),
                child: const CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            )
          : ListView.builder(
              itemCount: listUsers == null ? 0 : listUsers.length,
              itemBuilder: (BuildContext context, index) {
                return PersonComponent(
                    listUsers[index]["id"], listUsers[index], getData);
              },
            ),
    );
  }
}
