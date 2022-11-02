import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeDetailText extends StatelessWidget {
  AboutMeDetailText({
    required this.text,
    this.fontSize = 15,
    this.desktopFontSize = 17,
    Key? key,
  }) : super(key: key);
  String text;
  double fontSize;
  double desktopFontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          height: 1.5,
          fontSize: ResponsiveValue(
            context,
            defaultValue: fontSize,
            valueWhen: [
              Condition.largerThan(
                name: TABLET,
                value: desktopFontSize,
              )
            ],
          ).value,
          fontFamily: 'OpenSans',
          color: Colors.black.withOpacity(0.7),
        ));
  }
}
