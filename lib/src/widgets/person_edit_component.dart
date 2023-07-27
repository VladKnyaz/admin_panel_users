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
            margin: const EdgeInsets.only(top: 10),
            child: TextField(
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(14),
                hintText: super.widget.name,
                hintStyle: const TextStyle(fontSize: 13),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonInModal extends StatelessWidget {
  final String name;
  const ButtonInModal(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        alignment: Alignment.center,
        child: Text(
          "$name",
          style: TextStyle(
              color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
