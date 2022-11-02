import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimerText extends StatelessWidget {
  const CustomShimerText({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey.withOpacity(0.9),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
