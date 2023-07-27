import 'package:flutter/material.dart';

class ModalInputComponent extends StatefulWidget {
  final String name;
  EdgeInsetsGeometry? marginStyle;

  ModalInputComponent(this.name, this.marginStyle, {super.key});

  @override
  State<ModalInputComponent> createState() => _ModalInputComponentState();
}

class _ModalInputComponentState extends State<ModalInputComponent> {
  _ModalInputComponentState();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: super.widget.marginStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(super.widget.name, style: TextStyle(fontSize: 16)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.all(14),
                  hintText: super.widget.name,
                  hintStyle: TextStyle(fontSize: 13),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFCCCCCC), width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFFCCCCCC), width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
