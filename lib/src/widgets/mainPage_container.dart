import 'package:flutter/material.dart';
import 'package:users_app/src/widgets/list.dart';

class MainPageContainer extends StatelessWidget {
  String searchText = '';

  MainPageContainer({required this.searchText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        child: ListComponent(
          searchText: searchText,
        ),
        alignment: Alignment.topCenter,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
