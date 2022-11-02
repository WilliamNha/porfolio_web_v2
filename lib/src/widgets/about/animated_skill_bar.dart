import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';

class AnimatedSkillBar extends StatelessWidget {
  const AnimatedSkillBar({
    this.isAnimate = false,
    required this.languageName,
    required this.percentInt,
    required this.svgPath,
    required this.screenWidthSize,
    Key? key,
  }) : super(key: key);
  final String svgPath;
  final int percentInt;
  final String languageName;
  final double screenWidthSize;
  final bool isAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath,
              width: screenWidthSize > 1000 ? 18 : 16,
              height: screenWidthSize > 1000 ? 18 : 16,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              languageName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidthSize > 1000 ? 18 : 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: screenWidthSize > 1000 ? 20 : 0),
              child: Text(
                '$percentInt%',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: screenWidthSize > 1000 ? 18 : 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(right: screenWidthSize > 1000 ? 20 : 0),
                child: LinearPercentIndicator(
                  
                  padding: EdgeInsets.zero,
                  animation: true,
                  lineHeight: 6,
                  animationDuration: 2000,
                  percent: isAnimate ? percentInt / 100 : 0,
                  barRadius: const Radius.circular(15),
                  progressColor: AppColor.educationLineColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
