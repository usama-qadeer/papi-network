import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String? hintText;
  bool icon = false;
  AppTextField({required this.hintText, this.icon = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: Icon(
          icon == true ? Icons.check_circle : null,
          color: Colors.amber,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
