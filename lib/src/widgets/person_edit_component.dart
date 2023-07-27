import 'package:flutter/material.dart';

class ModalInputComponent extends StatelessWidget {
  final String name;
  EdgeInsetsGeometry? marginStyle;
  final Function onChangeFunction;

  ModalInputComponent(this.name, this.marginStyle,
      {required this.onChangeFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(name, style: TextStyle(fontSize: 16)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextField(
              onChanged: (value) {
                onChangeFunction(value);
                // super.widget.onChange(value);
              },
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(14),
                hintText: name,
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
  final Function onPressed;
  const ButtonInModal(this.name, {required this.onPressed, super.key});

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
      onPressed: () {
        onPressed();
      },
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
