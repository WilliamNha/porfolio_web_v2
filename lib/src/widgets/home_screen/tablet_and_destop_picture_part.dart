import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/modules/home/models/project_detail_model.dart';
import 'package:portfolio_project_v2/src/widgets/contact/custom_animated_send_button.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_my_image.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/check_my_work_button.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/crafted_with_love_part.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabletAndDesktopPicturePart extends StatefulWidget {
  final ScrollController scrollController;
  const TabletAndDesktopPicturePart({
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<TabletAndDesktopPicturePart> createState() =>
      _TabletAndDesktopPicturePartState();
}

bool isHovered = false;

class _TabletAndDesktopPicturePartState
    extends State<TabletAndDesktopPicturePart> {
  final shoeEzKey = GlobalKey();
  final cryptovestKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
        visible: false,
        visibleWhen: const [Condition.largerThan(name: MOBILE)],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                                  onTap: () {
                                    widget.scrollController.position
                                        .ensureVisible(
                                      shoeEzKey.currentContext!
                                          .findRenderObject()!,
                                      alignment:
                                          0.1, // How far into view the item should be scrolled (between 0 and 1).
                                      duration: const Duration(seconds: 1),
                                    );
                                  },
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
            ),
            // ============= crafted with love part
            const CraftedWIthLovePart(),
            // ============== project part
            CustomProjectShowDesktop(
              projectDetailModel: shopEzProjectDetail,
              globalKey: shoeEzKey,
              projectName: 'Shop Ez',
              projectDescription:
                  'A mobile app with beautiful UI that look like a professional ecommerce app.',
              imageList: shopEzImageList,
            ),
            CustomProjectShowDesktop(
              projectDetailModel: cryptovestProjectDetail,
              globalKey: cryptovestKey,
              projectName: 'Cryptovest',
              projectDescription:
                  'Crypto Investment App that come with simple and elegent user interface.',
              imageList: cryptovestImageList,
            ),
          ],
        ));
  }
}

class CustomProjectShowDesktop extends StatelessWidget {
  final ProjectDetailModel projectDetailModel;
  final String projectName;
  final String projectDescription;
  final List<String> imageList;

  const CustomProjectShowDesktop({
    required this.projectDetailModel,
    required this.imageList,
    required this.projectName,
    required this.projectDescription,
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
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
                child: Text(
                  projectName,
                  style: const TextStyle(
                      fontSize: 40,
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
                child: Text(
                  projectDescription,
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto',
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 18.0,
                      valueWhen: [
                        const Condition.smallerThan(
                          name: DESKTOP,
                          value: 16.0,
                        ),
                      ],
                    ).value,
                  ),
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
                    isHasArrowIcon: true,
                    buttonText: 'Check',
                    alignmentGeometry: Alignment.centerLeft,
                    onTab: () {
                      context.push('/project_detail',
                          extra: projectDetailModel);
                    },
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
                children: imageList.map((item) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        item,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var shopEzImageList = [
  'assets/images/work/shop_easy/get_in.png',
  'assets/images/work/shop_easy/home.png',
  'assets/images/work/shop_easy/shoes.png',
];

var cryptovestImageList = [
  'assets/images/work/cryptovest/crypto_1.png',
  'assets/images/work/cryptovest/crypto_2.png',
  'assets/images/work/cryptovest/crypto_3.png',
];
