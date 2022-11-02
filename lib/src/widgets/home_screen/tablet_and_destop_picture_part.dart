import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_my_image.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/check_my_work_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabletAndDesktopPicturePart extends StatefulWidget {
  const TabletAndDesktopPicturePart({
    Key? key,
  }) : super(key: key);

  @override
  State<TabletAndDesktopPicturePart> createState() =>
      _TabletAndDesktopPicturePartState();
}

bool isHovered = false;

class _TabletAndDesktopPicturePartState
    extends State<TabletAndDesktopPicturePart> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
        visible: false,
        visibleWhen: const [Condition.largerThan(name: MOBILE)],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(
                          left: ResponsiveValue(
                            context,
                            defaultValue: 10.0,
                            valueWhen: const [
                              Condition.smallerThan(
                                name: DESKTOP,
                                value: 20.0,
                              ),
                            ],
                          ).value!,
                          top: ResponsiveValue(
                            context,
                            defaultValue: 0.0,
                            valueWhen: const [
                              Condition.smallerThan(
                                name: DESKTOP,
                                value: 50.0,
                              ),
                            ],
                          ).value!,
                        ),
                        width: 450,
                        // padding: EdgeInsets,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Hi, My name is',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                fontSize: ResponsiveValue(
                                  context,
                                  defaultValue: 25.0,
                                  valueWhen: const [
                                    Condition.smallerThan(
                                      name: DESKTOP,
                                      value: 20.0,
                                    ),
                                  ],
                                ).value,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'PANHA HENG',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                fontSize: ResponsiveValue(
                                  context,
                                  defaultValue: 50.0,
                                  valueWhen: const [
                                    Condition.smallerThan(
                                      name: DESKTOP,
                                      value: 40.0,
                                    ),
                                  ],
                                ).value,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'A cross-platform mobile developer who has strong passion for coding and Web3 technology.',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CheckMyWorkButton(
                              onTap: () {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: ResponsiveValue(
                      context,
                      defaultValue: 0.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: DESKTOP,
                          value: 0.0,
                        ),
                      ],
                    ).value!,
                  ),
                  child: const AnimatedMyImage(),
                ),
              ),
            ],
          ),
        ));
  }
}
