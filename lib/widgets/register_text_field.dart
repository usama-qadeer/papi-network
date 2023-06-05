import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  String? title;
  String? hintText;
  Widget? icon;
  bool obscureText;
  TextInputType? myType = TextInputType.text;
  String? Function(String?)? validator;
  FocusNode? focusNode;

  TextEditingController controller;

  LoginTextField(
      {this.myType,
      this.focusNode,
      this.validator,
      required this.controller,
      this.icon,
      this.obscureText = false,
      required this.hintText,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == 'n'
            ? SizedBox()
            : Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    title!,
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, letterSpacing: 2),
                  ),
                ],
              ),
        SizedBox(
          height: title == 'n' ? 48 : null,
          child: Card(
            color: Colors.grey.shade100,
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
              child: TextFormField(
                controller: controller,
                validator: validator,
                focusNode: focusNode,
                keyboardType: myType,
                obscureText: obscureText,
                decoration: InputDecoration(
                  suffixIcon: icon,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        title == 'n'
            ? SizedBox()
            : SizedBox(
                height: 5,
              )
      ],
    );
  }
}
