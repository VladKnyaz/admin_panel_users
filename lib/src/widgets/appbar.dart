import 'package:flutter/material.dart';

class AppBarUsers extends StatefulWidget implements PreferredSizeWidget {
  Function changeSearchText;
  AppBarUsers({Key? key, required this.changeSearchText})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<AppBarUsers> createState() => _AppBarUsersState();
}

class _AppBarUsersState extends State<AppBarUsers> {
  String? search = '';

  @override
  Widget build(BuildContext context) {
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
          onChanged: (value) {
            search = value;
          },
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
                splashColor: Color.fromARGB(255, 112, 186, 255), // Splash color
                onTap: () {
                  widget.changeSearchText(search);
                },
                child:
                    SizedBox(width: 56, height: 56, child: Icon(Icons.search)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
