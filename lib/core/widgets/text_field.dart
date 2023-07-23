import 'package:flutter/material.dart';
import 'package:grad_project/core/extensions/extensions.dart';
import 'package:grad_project/core/resoursess/manager_colors.dart';
import 'package:grad_project/core/resoursess/manager_fonts.dart';
import 'package:grad_project/core/resoursess/manager_sizes.dart';
import 'package:grad_project/core/resoursess/manager_styles.dart';

TextFormField TextFieldWidget1({
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  bool? obscureText,
  validator,
  FocusNode? focusNode,
  onChange,
}) {
  return TextFormField(
    style: getRegularTextStyle(
      fontSize: ManagerFontSize.s16,
      color: ManagerColors.black,
    ),
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText.onNull(),
    validator: validator,
    focusNode: focusNode,
    onChanged: onChange ?? (val) {},
    decoration: InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h6,
      ),
      fillColor: ManagerColors.white,
      hintText: hintText.onNull(),
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
    ),
  );
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.obscureText,
      required this.icon_name})
      : super(key: key);
  final String title;
  final bool obscureText;
  final TextEditingController controller;
  final IconData icon_name;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(widget.icon_name),
              Text(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 328,
            height: 44,
            child: TextField(
              obscureText: widget.obscureText,
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              )),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
