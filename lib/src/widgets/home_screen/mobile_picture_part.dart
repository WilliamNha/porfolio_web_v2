import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_my_image.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/check_my_work_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MobilePicturePart extends StatefulWidget {
  const MobilePicturePart({
    Key? key,
  }) : super(key: key);

  @override
  State<MobilePicturePart> createState() => _MobilePicturePartState();
}

bool isHovered = false;

class _MobilePicturePartState extends State<MobilePicturePart> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [Condition.smallerThan(name: TABLET)],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AnimatedMyImage(),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70),
            child: Text(
              'Hi, My name is',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70),
            child: Text(
              'PANHA HENG',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70, right: 100),
            child: Text(
              'A cross-platform mobile developer who has strong passion for coding and Web3 technology.',
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto',
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: CheckMyWorkButton(
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
