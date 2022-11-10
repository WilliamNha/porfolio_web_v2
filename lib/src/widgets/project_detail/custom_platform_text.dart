import 'package:flutter/material.dart';

class CustomPlatformText extends StatelessWidget {
  final String title;
  final String detail;
  final double screenWidth;
  const CustomPlatformText({
    required this.detail,
    required this.title,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth < 1000 ? 17 : 19),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          detail,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: screenWidth < 1000 ? 15 : 16),
        ),
      ],
    );
  }
}
