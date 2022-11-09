import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/widgets/contact/custom_animated_send_button.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_my_image.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/check_my_work_button.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/crafted_with_love_part.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MobilePicturePart extends StatefulWidget {
  final ScrollController scrollController;
  const MobilePicturePart({
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<MobilePicturePart> createState() => _MobilePicturePartState();
}

bool isHovered = false;

class _MobilePicturePartState extends State<MobilePicturePart> {
  final shoeEzKey = GlobalKey();

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
              onTap: () {
                widget.scrollController.position.ensureVisible(
                  shoeEzKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.1, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(seconds: 1),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CraftedWIthLovePart(
            isOnMobile: true,
          ),
          Container(
            key: shoeEzKey,
            color: AppColor.primaryBackgroundColor,
            width: double.infinity,
            height: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10),
                      child: const Text(
                        'Shop Easy',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 20,
                      ),
                      child: const Text(
                        'A mobile app with beautiful UI that look like a real and professional ecommerce app.',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomAnimatedSendButton(
                          buttonHeight: 35,
                          buttonWidth: 100,
                          isHasArrowIcon: true,
                          buttonText: 'Check',
                          alignmentGeometry: Alignment.centerLeft,
                          onTab: () {},
                          screenWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Image.asset(
                                'assets/images/work/shop_easy/get_in.png',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Image.asset(
                                  'assets/images/work/shop_easy/home.png',
                                )),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
