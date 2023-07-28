import 'package:flutter/material.dart';

class ModalInputComponent extends StatefulWidget {
  final String name;
  EdgeInsetsGeometry? marginStyle;
  final Function onChangeFunction;

  ModalInputComponent(this.name, this.marginStyle,
      {required this.onChangeFunction, super.key});

  @override
  State<ModalInputComponent> createState() => _ModalInputComponentState();
}

class _ModalInputComponentState extends State<ModalInputComponent> {
  TextEditingController textController = TextEditingController(text: '');

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(textController.text);
    return Container(
      margin: widget.marginStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.name, style: TextStyle(fontSize: 16)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextField(
              controller: textController,
              onChanged: (value) {
                widget.onChangeFunction(value);
                // widget.onChangeFunction(textController.text);
              },
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(14),
                hintText: widget.name,
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
  bool? isLoading;

  ButtonInModal(this.name,
      {required this.onPressed, this.isLoading, super.key}) {
    isLoading = false;
  }

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
