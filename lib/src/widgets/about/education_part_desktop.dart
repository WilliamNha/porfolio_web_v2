import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/modules/about/controllers/about_me_controller.dart';
import 'package:portfolio_project_v2/src/widgets/about/custom_timeline_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

final _aboutMeController = Get.put(AboutMeController());

class EduactionPartDesktop extends StatefulWidget {
  const EduactionPartDesktop({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<EduactionPartDesktop> createState() => _EduactionPartDesktopState();
}

class _EduactionPartDesktopState extends State<EduactionPartDesktop> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //education title
              Padding(
                key: _aboutMeController.educationTitleKey,
                padding: EdgeInsets.only(
                  top: widget.screenWidth > 1000 ? 60 : 30,
                  bottom: widget.screenWidth > 1000 ? 60 : 30,
                ),
                child: Text(
                  'EDUCATION',
                  style: TextStyle(
                      fontSize: widget.screenWidth > 1000 ? 35 : 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans'),
                ),
              ),
              //education timeline
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  // color: Colors.red,
                  constraints: const BoxConstraints(maxHeight: 160),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Center(
                            child: Container(
                          width: widget.screenWidth > 1000 ? 50 : 35,
                          height: widget.screenWidth > 1000 ? 50 : 35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.educationLineColor, width: 5),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Image.asset(
                            'assets/images/graduation-cap.png',
                            width: widget.screenWidth > 1000 ? 30 : 20,
                            height: widget.screenWidth > 1000 ? 30 : 20,
                          )),
                        )),
                        Center(
                          child: Container(
                            width: widget.screenWidth > 1000 ? 60 : 40,
                            height: 5,
                            color: AppColor.educationLineColor,
                          ),
                        ),
                        CustomTimelineTile(
                          isVisible: _aboutMeController.isESLVisible.value,
                          programName: 'ESL PROGRAM',
                          schoolName: 'Beltei International Institute',
                          year: '2009 - 2014',
                          isStartChild: true,
                        ),
                        CustomTimelineTile(
                          isVisible:
                              _aboutMeController.isGeneralEngVisible.value,
                          programName: 'GENERAL ENGLISH PROGRAM',
                          schoolName: "Australian Center For Education",
                          year: '2014 - 2016',
                          isStartChild: false,
                        ),
                        CustomTimelineTile(
                          isVisible: _aboutMeController.isESLVisible.value,
                          programName: 'HIGH SCHOOL GRADUATION',
                          schoolName: 'Beltei International Institute',
                          year: '2018',
                        ),
                        CustomTimelineTile(
                          isVisible: _aboutMeController.isBachelorVisible.value,
                          programName: 'BACHELOR IN ICT',
                          schoolName: 'Rangsit University',
                          year: '2019 - 2022',
                          isStartChild: false,
                        ),
                        TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.center,
                          isLast: true,
                          indicatorStyle: IndicatorStyle(
                            width: 15.0,
                            height: 15.0,
                            color: AppColor.educationLineColor,
                            iconStyle: IconStyle(
                              color: Colors.white,
                              iconData: Icons.fiber_manual_record,
                              fontSize: 10,
                            ),
                          ),
                          beforeLineStyle: LineStyle(
                            color: AppColor.educationLineColor,
                            thickness: 5.0,
                          ),
                          startChild: Container(
                            constraints: const BoxConstraints(
                              minWidth: 150,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: _aboutMeController
                                      .isMoreToComeVisible.value,
                                  child: DelayedDisplay(
                                    delay: const Duration(milliseconds: 1800),
                                    fadingDuration:
                                        const Duration(milliseconds: 1300),
                                    slidingBeginOffset: const Offset(0, -0.2),
                                    child: Text(
                                      'More to come',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: widget.screenWidth > 1000
                                            ? 16.0
                                            : 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        )
                      ])),

              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
