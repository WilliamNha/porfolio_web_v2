import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    required this.screenWidth,
    required this.textEditingController,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final double screenWidth;
  final TextEditingController textEditingController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: textEditingController,
      maxLines: 5,
      style: TextStyle(
          color: Colors.black, fontSize: screenWidth > 1000 ? 15 : 13),
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.primaryBackgroundColor,
          hintText: "Tell me something",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintStyle: TextStyle(
              fontSize: screenWidth > 1000 ? 15 : 13, color: Colors.black38),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: AppColor.primaryBackgroundColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black38),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
