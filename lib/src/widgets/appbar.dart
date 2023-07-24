import 'package:flutter/material.dart';

class AppBarUsers {
  String? search;

  AppBar build() {
    return AppBar(
      centerTitle: true,
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        width: 260,
        height: 36,
        padding: EdgeInsets.only(left: 10, right: 10, top: 6),
        child: TextField(
          decoration: InputDecoration(
              isCollapsed: true, hintText: "Search", border: InputBorder.none),
        ),
      ),
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 22),
            width: 36,
            height: 36,
            child: ClipOval(
              child: Material(
                color: const Color.fromARGB(255, 255, 255, 255), // Button color
                child: InkWell(
                  splashColor:
                      Color.fromARGB(255, 112, 186, 255), // Splash color
                  onTap: () {},
                  child: SizedBox(
                      width: 56, height: 56, child: Icon(Icons.search)),
                ),
              ),
            ))
      ],
    );
  }
}
