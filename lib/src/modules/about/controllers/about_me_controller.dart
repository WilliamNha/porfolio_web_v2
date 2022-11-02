import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController {
  GlobalKey aboutMeAndPhotoPartKey = GlobalKey();
  GlobalKey educationPartMobileKey = GlobalKey();
  GlobalKey skillPartMobileKey = GlobalKey();
  //education part
  GlobalKey eslProgramKey = GlobalKey();
  GlobalKey generalEnglishKey = GlobalKey();
  GlobalKey highSchoolKey = GlobalKey();
  GlobalKey bachelorKey = GlobalKey();
  GlobalKey educationTitleKey = GlobalKey();
  GlobalKey grationHatKey = GlobalKey();
  GlobalKey educationPartKey = GlobalKey();

  //skill part
  GlobalKey skillPartKey = GlobalKey();
  GlobalKey dartKey = GlobalKey();
  GlobalKey flutterKey = GlobalKey();
  GlobalKey kotlinKey = GlobalKey();
  GlobalKey firebaseKey = GlobalKey();
  GlobalKey mySQLKey = GlobalKey();
  GlobalKey flaskKey = GlobalKey();
  double sum = 0;

  getHeight({required List<GlobalKey> list}) {
    sum = 0;
    for (var e in list) {
      sum += e.currentContext!.size!.height;
    }
    // print('sum : $sum');
    return sum;
  }

  //eucation part
  final isESLVisible = false.obs;
  final isGeneralEngVisible = false.obs;
  final isHighSchoolVisible = false.obs;
  final isBachelorVisible = false.obs;
  final isMoreToComeVisible = false.obs;
  //skill part
  final isDartAnimated = false.obs;
  final isFlutterAnimated = false.obs;
  final isKotlinAnimated = false.obs;

  final isFirebaseAnimated = false.obs;
  final isMySQLAnimated = false.obs;
  final isFlaskAnimated = false.obs;

  final isHtmlAnimated = false.obs;
  final isCssAnimated = false.obs;
  final isJavascriptAnimated = false.obs;

  final isPythonAnimated = false.obs;
  final isJavaAnimated = false.obs;
  final isCAnimated = false.obs;
  //quote part

  final isQuoteAnimated = false.obs;
  // final isElonNameAnimated = false.obs;
  final isLeftSizeQuoteBoxAnimated = false.obs;
  final isRightSizeQuoteBoxAnimated = false.obs;
}
