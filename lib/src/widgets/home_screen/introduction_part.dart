import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/mobile_picture_part.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/tablet_and_destop_picture_part.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IntroductionPart extends StatelessWidget {
  const IntroductionPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
      ),
      child: Stack(
        children: [
          //WHite circle background
          SizedBox(
            width: double.infinity,
            height: ResponsiveValue(
              context,
              defaultValue: 700.0,
              valueWhen: const [
                Condition.smallerThan(
                  name: DESKTOP,
                  value: 587.0,
                ),
              ],
            ).value,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: ResponsiveValue(
                    context,
                    defaultValue: 100.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: TABLET,
                        value: 220.0,
                      ),
                    ],
                  ).value!,
                ),
                width: ResponsiveValue(
                  context,
                  defaultValue: MediaQuery.of(context).size.width * 0.30,
                  valueWhen: [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ).value,
                height: ResponsiveValue(
                  context,
                  defaultValue: MediaQuery.of(context).size.width * 0.30,
                  valueWhen: [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ).value,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: ResponsiveValue(
                  context,
                  defaultValue: 120.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 80.0,
                    ),
                  ],
                ).value,
              ),
              //For Table and desktop view
              const TabletAndDesktopPicturePart(),
              //For Mobile view
              const MobilePicturePart(),
            ],
          ),
        ],
      ),
    );
  }
}
