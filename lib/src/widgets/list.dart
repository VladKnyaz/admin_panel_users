import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  ListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Container(
          color: Colors.grey,
          height: 128,
          margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
          child: Text(
            "test",
            style: TextStyle(color: Colors.red),
          ),
        ),
        Container(
          color: Colors.grey,
          height: 128,
          margin: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
          child: Text(
            "test",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }
}
