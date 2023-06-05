import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? title;
  String? hintText;
  Widget? icon;
  double? height = 34;
  FocusNode? focusNode;
  TextEditingController? controller;
  bool obscureText;
  TextInputType? myType = TextInputType.text;
  String? Function(String?)? validator;

  CustomTextField(
      {this.height,
      this.obscureText = false,
      this.myType,
      this.validator,
      this.controller,
      this.icon,
      this.focusNode,
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
                    width: 5,
                  ),
                  Text(
                    title!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
        SizedBox(
          height: height,
          child: Card(
            color: Colors.grey.shade100,
            clipBehavior: Clip.antiAlias,
            elevation: title == 'n' ? 0 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
                child: TextFormField(
                  obscureText: obscureText,
                  validator: validator,
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: myType,
                  decoration: InputDecoration(
                    suffixIcon: icon,
                    hintText: hintText,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                )),
          ),
        ),
        SizedBox(
          height: title == 'n' ? 0 : 4,
        )
      ],
    );
  }
}
