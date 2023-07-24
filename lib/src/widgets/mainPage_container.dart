import 'package:flutter/material.dart';
import 'package:users_app/src/widgets/list.dart';

class MainPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        child: ListComponent(),
        alignment: Alignment.topCenter,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 37, 30, 46)),
    );
  }
}
