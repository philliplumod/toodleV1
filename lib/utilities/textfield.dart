import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  String hintText;
  String labelText;
  TextField({
    Key? key,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: 'Email',
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}
