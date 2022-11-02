import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/modules/about/controllers/about_me_controller.dart';
import 'package:portfolio_project_v2/src/widgets/about/about_me_part_desktop.dart';
import 'package:portfolio_project_v2/src/widgets/about/animated_skill_bar.dart';
import 'package:portfolio_project_v2/src/widgets/about/education_part_desktop.dart';

import '../../modules/about/models/development_skill_model.dart';
// import 'package:responsive_framework/responsive_framework.dart';

class TabletAndDesktopSize extends StatefulWidget {
  const TabletAndDesktopSize({
    required this.screenHeight,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  @override
  State<TabletAndDesktopSize> createState() => _TabletAndDesktopSizeState();
}

class _TabletAndDesktopSizeState extends State<TabletAndDesktopSize> {
  final _aboutMeController = Get.put(AboutMeController());
  var isLeftSideAnimated = false;
  var isRightSideAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: widget.screenWidth >= 800,
          child: Container(
            color: AppColor.primaryBackgroundColor,
            child: Column(
              children: [
                AboutMeAndPhotoPart(
                  key: _aboutMeController.aboutMeAndPhotoPartKey,
                ),
                EduactionPartDesktop(
                  key: _aboutMeController.educationPartKey,
                  screenWidth: widget.screenWidth,
                ),
                //skill part
                Container(
                  key: _aboutMeController.skillPartKey,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.screenWidth > 1000 ? 50 : 40,
                            bottom: widget.screenWidth > 1000 ? 50 : 40,
                          ),
                          child: Text(
                            'SKILLS',
                            style: TextStyle(
                                fontSize: widget.screenWidth > 1000 ? 35 : 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //child left
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width:
                                        widget.screenWidth > 1000 ? 400 : 300,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listSkillModel[index]
                                                        .skillTitle!,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            widget.screenWidth >
                                                                    1000
                                                                ? 22
                                                                : 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'OpenSans'),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, indexx) {
                                                      var skillItem =
                                                          listSkillModel[index]
                                                                  .skillModelList![
                                                              indexx];
                                                      return Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          AnimatedSkillBar(
                                                              isAnimate: index ==
                                                                      0
                                                                  ? indexx == 0
                                                                      ? _aboutMeController
                                                                          .isDartAnimated
                                                                          .value
                                                                      : indexx ==
                                                                              1
                                                                          ? _aboutMeController
                                                                              .isFlutterAnimated
                                                                              .value
                                                                          : indexx ==
                                                                                  2
                                                                              ? _aboutMeController
                                                                                  .isKotlinAnimated.value
                                                                              : false
                                                                  : index == 1
                                                                      ? indexx ==
                                                                              0
                                                                          ? _aboutMeController
                                                                              .isHtmlAnimated
                                                                              .value
                                                                          : indexx ==
                                                                                  1
                                                                              ? _aboutMeController
                                                                                  .isCssAnimated.value
                                                                              : mounted
                                                                                  ? indexx ==
                                                                                          2
                                                                                      ? _aboutMeController
                                                                                          .isJavascriptAnimated.value
                                                                                      : false
                                                                                  : false
                                                                      : false,
                                                              screenWidthSize:
                                                                  widget
                                                                      .screenWidth,
                                                              languageName:
                                                                  skillItem
                                                                      .title!,
                                                              percentInt:
                                                                  skillItem
                                                                      .percent!,
                                                              svgPath: skillItem
                                                                  .svgFilePath!),
                                                          SizedBox(
                                                            height: index ==
                                                                        1 &&
                                                                    indexx == 2
                                                                ? 0
                                                                : 20,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    itemCount:
                                                        listSkillModel[index]
                                                            .skillModelList!
                                                            .length,
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount: 2,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    width:
                                        widget.screenWidth > 1000 ? 400 : 300,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listSkillModel[index + 2]
                                                        .skillTitle!,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            widget.screenWidth >
                                                                    1000
                                                                ? 22
                                                                : 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'OpenSans'),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, indexx) {
                                                      var skillItem =
                                                          listSkillModel[
                                                                      index + 2]
                                                                  .skillModelList![
                                                              indexx];
                                                      return Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          AnimatedSkillBar(
                                                              isAnimate: index ==
                                                                      0
                                                                  ? indexx == 0
                                                                      ? _aboutMeController
                                                                          .isFirebaseAnimated
                                                                          .value
                                                                      : indexx ==
                                                                              1
                                                                          ? _aboutMeController
                                                                              .isMySQLAnimated
                                                                              .value
                                                                          : indexx ==
                                                                                  2
                                                                              ? _aboutMeController
                                                                                  .isFlaskAnimated.value
                                                                              : false
                                                                  : index == 1
                                                                      ? indexx ==
                                                                              0
                                                                          ? _aboutMeController
                                                                              .isPythonAnimated
                                                                              .value
                                                                          : indexx ==
                                                                                  1
                                                                              ? _aboutMeController
                                                                                  .isJavaAnimated.value
                                                                              : mounted
                                                                                  ? indexx ==
                                                                                          2
                                                                                      ? _aboutMeController
                                                                                          .isCAnimated.value
                                                                                      : false
                                                                                  : false
                                                                      : false,
                                                              screenWidthSize:
                                                                  widget
                                                                      .screenWidth,
                                                              languageName:
                                                                  skillItem
                                                                      .title!,
                                                              percentInt:
                                                                  skillItem
                                                                      .percent!,
                                                              svgPath: skillItem
                                                                  .svgFilePath!),
                                                          SizedBox(
                                                            height: index ==
                                                                        1 &&
                                                                    indexx == 2
                                                                ? 0
                                                                : 20,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    itemCount:
                                                        listSkillModel[index]
                                                            .skillModelList!
                                                            .length,
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount: 2,
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        )
                      ]),
                ),
                //quote part
                Container(
                  color: AppColor.primaryBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset(
                                  'assets/images/elon_musk.png',
                                  fit: BoxFit.fitHeight,
                                  height: widget.screenWidth > 1000 ? 300 : 260,
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                              visible:
                                  !_aboutMeController.isQuoteAnimated.value,
                              child: SizedBox(
                                width: widget.screenWidth > 1000 ? 400 : 350,
                                height: 300,
                              )),
                          Visibility(
                            visible: _aboutMeController.isQuoteAnimated.value,
                            child: SizedBox(
                              width: widget.screenWidth > 1000 ? 400 : 350,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      _aboutMeController
                                              .isRightSizeQuoteBoxAnimated.value
                                          ? const SizedBox()
                                          : AnimatedPositioned(
                                              left: 0,
                                              curve: Curves.linear,
                                              width: _aboutMeController
                                                      .isLeftSizeQuoteBoxAnimated
                                                      .value
                                                  ? widget.screenWidth > 1000
                                                      ? 380
                                                      : 330
                                                  : 0,
                                              height: 300,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              )),
                                      AnimatedPositioned(
                                          right: 20,
                                          curve: Curves.linear,
                                          width: _aboutMeController
                                                  .isRightSizeQuoteBoxAnimated
                                                  .value
                                              ? 0
                                              : 400,
                                          height: 300,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: _aboutMeController
                                                      .isRightSizeQuoteBoxAnimated
                                                      .value
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                          )),
                                      Center(
                                        child: DelayedDisplay(
                                          slidingBeginOffset:
                                              const Offset(0, 1.3),
                                          fadingDuration:
                                              const Duration(milliseconds: 500),
                                          delay: const Duration(
                                              milliseconds: 1100),
                                          child: Text(
                                            "“Take risk now and do something bold. You won't regret it.”",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize:
                                                    widget.screenWidth > 1000
                                                        ? 25
                                                        : 22,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: _aboutMeController
                                        .isQuoteAnimated.value,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        width: 130,
                                        child: Stack(
                                          children: [
                                            _aboutMeController
                                                    .isRightSizeQuoteBoxAnimated
                                                    .value
                                                ? const SizedBox()
                                                : AnimatedPositioned(
                                                    left: 0,
                                                    curve: Curves.linear,
                                                    width: _aboutMeController
                                                            .isLeftSizeQuoteBoxAnimated
                                                            .value
                                                        ? 110
                                                        : 0,
                                                    height: 30,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                      ),
                                                    )),
                                            AnimatedPositioned(
                                                right: 20,
                                                curve: Curves.linear,
                                                width: _aboutMeController
                                                        .isRightSizeQuoteBoxAnimated
                                                        .value
                                                    ? 0
                                                    : 110,
                                                height: 30,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _aboutMeController
                                                            .isRightSizeQuoteBoxAnimated
                                                            .value
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                )),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: widget.screenWidth >
                                                            1000
                                                        ? 25
                                                        : 30),
                                                child: DelayedDisplay(
                                                  slidingBeginOffset:
                                                      const Offset(0, 1.5),
                                                  fadingDuration:
                                                      const Duration(
                                                          milliseconds: 500),
                                                  delay: const Duration(
                                                      milliseconds: 1100),
                                                  child: Text(
                                                    "Elon Musk",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            widget.screenWidth >
                                                                    1000
                                                                ? 22
                                                                : 20,
                                                        fontFamily: 'Roboto'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 20),
                                  //   child: Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Container(
                                  //       width: 110,
                                  //       height: 30,
                                  //       color: Colors.black,
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
