import 'package:flutter/material.dart';

class CustomLanguageLogo extends StatelessWidget {
  const CustomLanguageLogo({
    required this.imagePath,
    Key? key,
  }) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Image.asset(imagePath),
    );
  }
}
