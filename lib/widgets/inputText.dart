import 'package:flutter/material.dart';

class InputTextOwn extends StatelessWidget {
  final String text;
  final Function(String) validator;
  final bool isSecure;
  final TextInputType inputType;

  const InputTextOwn(
      {Key key,
      @required this.text,
      @required this.validator,
      this.isSecure = false,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.inputType,
      obscureText: this.isSecure,
      validator: this.validator,
      decoration: InputDecoration(labelText: this.text),
    );
  }
}
