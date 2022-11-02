import 'package:circular_rotation/circular_rotation.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_language_logo.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AnimatedMyImage extends StatelessWidget {
  const AnimatedMyImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      fadingDuration: const Duration(milliseconds: 1400),
      delay: Duration(
        milliseconds: ResponsiveValue(
          context,
          defaultValue: 1000,
          valueWhen: const [
            Condition.equals(
              name: MOBILE,
              value: 700,
            ),
          ],
        ).value!,
      ),
      slidingBeginOffset: const Offset(2.0, 0.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              height: ResponsiveValue(
                context,
                defaultValue: 590.0,
                valueWhen: const [
                  Condition.smallerThan(
                    name: DESKTOP,
                    value: 510.0,
                  ),
                ],
              ).value!,
              width: double.infinity,
              child: Image.asset(
                'assets/images/my_pic.png',
              )),
          Positioned.fill(
            bottom: 250,
            right: ResponsiveValue(
              context,
              defaultValue: 320,
              valueWhen: const [
                Condition.smallerThan(
                  name: DESKTOP,
                  value: 260.0,
                ),
              ],
            ).value!.toDouble(),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                // color: Colors.red,
                width: 140,
                height: 140,
                child: CircularRotation(
                  circularRotationProperty: CircularRotationModel(
                    defaultCircleStrokeWidth: 0.2,
                    defaultCircleStrokeColor: Colors.transparent,
                    startAnimation: true,
                    repeatAnimation: true,
                    firstCircleAnimationDuration: 10000,
                    centerWidget: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    firstCircleRadius: 14,
                    firstCircleRadians: 14,
                    firstCircleWidgets: [
                      const CustomLanguageLogo(
                        imagePath: 'assets/images/flutter_logo.png',
                      ),
                      const CustomLanguageLogo(
                        imagePath: 'assets/images/dart_logo.png',
                      ),
                      const CustomLanguageLogo(
                        imagePath: 'assets/images/firebase_logo.png',
                      ),
                      const CustomLanguageLogo(
                        imagePath: 'assets/images/python_logo.png',
                      ),
                      const CustomLanguageLogo(
                        imagePath: 'assets/images/javascript_logo.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
