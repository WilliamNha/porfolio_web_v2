import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/modules/about/controllers/about_me_controller.dart';
import 'package:portfolio_project_v2/src/widgets/about/about_me_part_mobile.dart';
import 'package:portfolio_project_v2/src/widgets/about/animated_skill_bar.dart';
import 'package:portfolio_project_v2/src/widgets/about/education_part_mobile.dart';

import '../../modules/about/models/development_skill_model.dart';

class MobileSize extends StatefulWidget {
  const MobileSize({
    required this.screenHeightSize,
    required this.screenWidthSize,
    Key? key,
  }) : super(key: key);
  final double screenHeightSize;
  final double screenWidthSize;

  @override
  State<MobileSize> createState() => _MobileSizeState();
}

class _MobileSizeState extends State<MobileSize> {
  final _aboutMeController = Get.put(AboutMeController());
  checkSkillAnimated(firstIndex, secondIndex) {
    if (firstIndex == 0) {
      if (secondIndex == 0) {
        return _aboutMeController.isDartAnimated.value;
      } else if (secondIndex == 1) {
        return _aboutMeController.isFlutterAnimated.value;
      } else if (secondIndex == 2) {
        return _aboutMeController.isKotlinAnimated.value;
      } else {
        return false;
      }
    } else if (firstIndex == 1) {
      if (secondIndex == 0) {
        return _aboutMeController.isHtmlAnimated.value;
      } else if (secondIndex == 1) {
        return _aboutMeController.isCssAnimated.value;
      } else if (secondIndex == 2) {
        return _aboutMeController.isJavascriptAnimated.value;
      } else {
        return false;
      }
    } else if (firstIndex == 2) {
      if (secondIndex == 0) {
        return _aboutMeController.isFirebaseAnimated.value;
      } else if (secondIndex == 1) {
        return _aboutMeController.isMySQLAnimated.value;
      } else if (secondIndex == 2) {
        return _aboutMeController.isFlaskAnimated.value;
      } else {
        return false;
      }
    } else if (firstIndex == 3) {
      if (secondIndex == 0) {
        return _aboutMeController.isPythonAnimated.value;
      } else if (secondIndex == 1) {
        return _aboutMeController.isJavaAnimated.value;
      } else if (secondIndex == 2) {
        return _aboutMeController.isCAnimated.value;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: widget.screenWidthSize < 800,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //about me part
              AboutMePartMobile(
                key: _aboutMeController.aboutMeAndPhotoPartKey,
              ),
              //education part
              EducationPartMobile(
                  key: _aboutMeController.educationPartMobileKey,
                  aboutMeController: _aboutMeController),
              //skill part
              SizedBox(
                key: _aboutMeController.skillPartMobileKey,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'SKILLS',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listSkillModel[index].skillTitle!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listSkillModel[index]
                                      .skillModelList!
                                      .length,
                                  itemBuilder: (context, indexx) {
                                    var skillItem = listSkillModel[index]
                                        .skillModelList![indexx];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AnimatedSkillBar(
                                            isAnimate: checkSkillAnimated(
                                                index, indexx),
                                            screenWidthSize:
                                                widget.screenWidthSize,
                                            languageName: skillItem.title!,
                                            percentInt: skillItem.percent!,
                                            svgPath: skillItem.svgFilePath!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    );
                                  }),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                        itemCount: listSkillModel.length,
                      ),
                    ]),
              ),
              //quote part
              Container(
                width: double.infinity,
                color: AppColor.primaryBackgroundColor,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: 580,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Visibility(
                            visible: _aboutMeController.isQuoteAnimated.value,
                            child: Stack(
                              children: [
                                const Center(
                                  child: DelayedDisplay(
                                    slidingBeginOffset: Offset(0, 1.3),
                                    fadingDuration: Duration(milliseconds: 500),
                                    delay: Duration(milliseconds: 1100),
                                    child: Text(
                                      "“Take risk now and do something bold. You won't regret it.”",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                ),
                                _aboutMeController
                                        .isRightSizeQuoteBoxAnimated.value
                                    ? const SizedBox()
                                    : AnimatedPositioned(
                                        left: 0,
                                        curve: Curves.linear,
                                        width: _aboutMeController
                                                .isLeftSizeQuoteBoxAnimated
                                                .value
                                            ? 520
                                            : 0,
                                        height: 300,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        )),
                                AnimatedPositioned(
                                    right: 0,
                                    curve: Curves.linear,
                                    width: _aboutMeController
                                            .isRightSizeQuoteBoxAnimated.value
                                        ? 0
                                        : 520,
                                    height: 300,
                                    duration: const Duration(milliseconds: 500),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _aboutMeController
                                                .isRightSizeQuoteBoxAnimated
                                                .value
                                            ? Colors.black
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: _aboutMeController.isQuoteAnimated.value,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 90,
                                child: Stack(
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
                                                ? 90
                                                : 0,
                                            height: 50,
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
                                        right: 0,
                                        curve: Curves.linear,
                                        width: _aboutMeController
                                                .isRightSizeQuoteBoxAnimated
                                                .value
                                            ? 0
                                            : 90,
                                        height: 50,
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
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 0),
                                        child: DelayedDisplay(
                                          slidingBeginOffset: Offset(0, 1.5),
                                          fadingDuration:
                                              Duration(milliseconds: 500),
                                          delay: Duration(milliseconds: 1100),
                                          child: Text(
                                            "Elon Musk",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19,
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
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset(
                              'assets/images/elon_musk.png',
                              fit: BoxFit.fitHeight,
                              height: 260,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
