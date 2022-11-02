import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';

class TextfieldWithLabel extends StatelessWidget {
  const TextfieldWithLabel({
    this.fontSize = 13,
    required this.labelText,
    required this.hintText,
    required this.screenWidth,
    required this.textEditingController,
    required this.onChanged,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final double screenWidth;
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              labelText,
              style: TextStyle(fontSize: screenWidth > 1000 ? 15 : fontSize),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextField(
                onChanged: onChanged,
                controller: textEditingController,
                style: const TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    fillColor: AppColor.primaryBackgroundColor,
                    hintStyle: TextStyle(
                        fontSize: screenWidth > 1000 ? 15 : fontSize,
                        color: Colors.black38),
                    hintText: hintText,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColor.primaryBackgroundColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
