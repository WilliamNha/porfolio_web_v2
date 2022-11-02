import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/widgets/about/custom_timeline_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../modules/about/controllers/about_me_controller.dart';

class EducationPartMobile extends StatelessWidget {
  const EducationPartMobile({
    Key? key,
    required this.aboutMeController,
  }) : super(key: key);

  final AboutMeController aboutMeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          key: aboutMeController.educationPartKey,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //education title part
              Padding(
                key: aboutMeController.educationTitleKey,
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'EDUCATION',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'),
                    ),
                  ],
                ),
              ),

              Column(
                key: aboutMeController.grationHatKey,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.educationLineColor, width: 5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Image.asset(
                      'assets/images/graduation-cap.png',
                      width: 30,
                      height: 30,
                    )),
                  ),
                  Center(
                    child: Container(
                      height: 20,
                      width: 5,
                      color: const Color(0xff3E5C76),
                    ),
                  ),
                ],
              ),
              CustomTimelineTile(
                key: aboutMeController.eslProgramKey,
                isVisible: aboutMeController.isESLVisible.value,
                isOnMobile: true,
                isHorizontal: false,
                programName: 'ESL PROGRAM',
                schoolName: 'Beltei International Institute',
                year: '2009 - 2014',
                isStartChild: true,
              ),
              CustomTimelineTile(
                key: aboutMeController.generalEnglishKey,
                isVisible: aboutMeController.isGeneralEngVisible.value,
                isOnMobile: true,
                isHorizontal: false,
                programName: 'GENERAL ENGLISH PROGRAM',
                schoolName: "Australian Center For Education",
                year: '2014 - 2016',
                isStartChild: false,
              ),
              CustomTimelineTile(
                key: aboutMeController.highSchoolKey,
                isVisible: aboutMeController.isHighSchoolVisible.value,
                isOnMobile: true,
                isHorizontal: false,
                programName: 'HIGH SCHOOL GRADUATION',
                schoolName: 'Beltei International Institute',
                year: '2018',
                isStartChild: true,
              ),
              CustomTimelineTile(
                key: aboutMeController.bachelorKey,
                isVisible: aboutMeController.isBachelorVisible.value,
                isOnMobile: true,
                isHorizontal: false,
                programName: 'BACHELOR IN ICT',
                schoolName: 'Rangsit University',
                year: '2019 - 2022',
                isStartChild: false,
              ),
              TimelineTile(
                isLast: true,
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.center,
                indicatorStyle: IndicatorStyle(
                  width: 20.0,
                  height: 20.0,
                  color: AppColor.educationLineColor,
                  iconStyle: IconStyle(
                    color: Colors.white,
                    iconData: Icons.fiber_manual_record,
                    fontSize: 12,
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
                  child: Visibility(
                    visible: aboutMeController.isMoreToComeVisible.value,
                    child: DelayedDisplay(
                      fadingDuration: const Duration(milliseconds: 1000),
                      slidingBeginOffset: const Offset(-0.2, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(
                              'More to come',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //skill part
            ],
          ),
        ));
  }
}
