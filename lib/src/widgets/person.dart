import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:users_app/src/services/user.service.dart';
import 'package:users_app/src/utils/time.dart';
import 'package:users_app/src/widgets/person_edit_modal_sheet.dart';

class PersonComponent extends StatelessWidget {
  int _id;
  Map<String, dynamic> userInfo;
  Function getData;

  PersonComponent(this._id, this.userInfo, this.getData, {super.key});

  @override
  Widget build(BuildContext context) {
    var date = userInfo['date'].replaceAll('/', '.');
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFD9D9D9),
        ),
        height: 128,
        margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userInfo["info"]["name"],
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "$date",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
            ),
            Expanded(
              child: Container(
                  child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${userInfo['info']['login']}",
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${userInfo['info']['password']}",
                    ),
                  ),
                ],
              )),
            ),
            Expanded(
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(0, 255, 255, 255), // Button color
                        child: InkWell(
                          onTap: () {
                            showModalPersonSheet(context);
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.edit)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    child: ClipOval(
                      child: Material(
                        color: Color.fromARGB(0, 255, 255, 255), // Button color
                        child: InkWell(
                          onTap: () {
                            UserService.deleteUser(_id);

                            getData(); // из list.dart
                          },
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.delete)),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ));
  }
}
