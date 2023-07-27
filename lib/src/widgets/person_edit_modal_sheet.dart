import 'package:flutter/material.dart';
import 'package:users_app/src/widgets/person_edit_component.dart';

var showModalPersonSheet = (BuildContext context) => {
      // передалть в виджет!!!
      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.only(left: 42, top: 40, right: 42),
              height: MediaQuery.of(context).size.height * 0.84,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Text(
                  "ID",
                  style: TextStyle(fontSize: 24),
                ),
                ModalInputComponent("Имя", null),
                ModalInputComponent("Логин", EdgeInsets.only(top: 25)),
                ModalInputComponent("Пароль", EdgeInsets.only(top: 25)),
                Row(
                  children: [
                    OutlinedButton(onPressed: () {}, child: Text("sad")),
                    TextButton(
                      onPressed: () {},
                      child: Text("sad"),
                    )
                  ],
                )
              ]),
            );
          })
    };
