import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_project_v2/main.dart';
import 'package:portfolio_project_v2/src/modules/about/controllers/about_me_controller.dart';
import 'package:portfolio_project_v2/src/modules/footer/screens/footer_section.dart';
import 'package:portfolio_project_v2/src/widgets/about/mobile_size.dart';
import 'package:portfolio_project_v2/src/widgets/about/tablet_and_desktop_size.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_animated_drawer.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_transition_container.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    super.key,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  final _aboutMeController = Get.put(AboutMeController());
  AnimationController? animationController;

  Animation<double>? animation;
  final ScrollController _scrollController = ScrollController();
  double screenSizePixel = 0;

  double _scrollPosition = 0;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    showOverlayTransAboutScreen(context);
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
  }

  showOverlayTransAboutScreen(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context)!;
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return const AnimatedTransContainer();
    });
    setState(() {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => overlayState.insert(overlayEntry));
    });

    await Future.delayed(const Duration(milliseconds: 2100));

    setState(() {
      overlayEntry.remove();
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 800) {
      if (MediaQuery.of(context).size.height > 751) {
        _aboutMeController.isESLVisible.value = true;
        _aboutMeController.isHighSchoolVisible.value = true;
        _aboutMeController.isMoreToComeVisible.value = true;
      }
      if (MediaQuery.of(context).size.height >= 821) {
        _aboutMeController.isESLVisible.value = true;
        _aboutMeController.isHighSchoolVisible.value = true;
        _aboutMeController.isMoreToComeVisible.value = true;
        _aboutMeController.isGeneralEngVisible.value = true;
        _aboutMeController.isBachelorVisible.value = true;
      }
    }

    double screenWidthSize = MediaQuery.of(context).size.width;
    double screenHeightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      drawer: CustomAnimatedDrawer(
          isAboutHover: true,
          animation: animation,
          animationController: animationController),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            animationController: animationController,
            globalKey: _key,
            itemHovered: itemHovered,
            isSelected: 1,
          )),
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (scroll) {
          // debugPrint(
          //     'scroll pixel ${_scrollController.position.pixels + MediaQuery.of(context).size.height}');
          screenSizePixel = _scrollController.position.pixels +
              MediaQuery.of(context).size.height;
          if (MediaQuery.of(context).size.width >= 800) {
            //for tablet and desktop
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationTitleKey,
                    ]) +
                    40) {
              _aboutMeController.isESLVisible.value = true;
              _aboutMeController.isHighSchoolVisible.value = true;
              _aboutMeController.isMoreToComeVisible.value = true;
            }
            if (screenSizePixel >
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationTitleKey,
                    ]) +
                    90) {
              _aboutMeController.isGeneralEngVisible.value = true;
              _aboutMeController.isBachelorVisible.value = true;
            }
            //dart and firebase
            if (screenSizePixel > 1128 && screenWidthSize >= 1000) {
              _aboutMeController.isDartAnimated.value = true;
              _aboutMeController.isFirebaseAnimated.value = true;
            } else if (screenSizePixel > 1020 && screenWidthSize < 1000) {
              _aboutMeController.isDartAnimated.value = true;
              _aboutMeController.isFirebaseAnimated.value = true;
            }
            //flutter and mysql
            if (screenSizePixel > 1186 && screenWidthSize >= 1000) {
              _aboutMeController.isFlutterAnimated.value = true;
              _aboutMeController.isMySQLAnimated.value = true;
            } else if (screenSizePixel > 1076 && screenWidthSize < 1000) {
              _aboutMeController.isFlutterAnimated.value = true;
              _aboutMeController.isMySQLAnimated.value = true;
            }
            //kotlin and flask
            if (screenSizePixel > 1250 && screenWidthSize >= 1000) {
              _aboutMeController.isKotlinAnimated.value = true;
              _aboutMeController.isFlaskAnimated.value = true;
            } else if (screenSizePixel > 1135 && screenWidthSize < 1000) {
              _aboutMeController.isKotlinAnimated.value = true;
              _aboutMeController.isFlaskAnimated.value = true;
            }
            //html and python
            if (screenSizePixel > 1361 && screenWidthSize >= 1000) {
              _aboutMeController.isHtmlAnimated.value = true;
              _aboutMeController.isPythonAnimated.value = true;
            } else if (screenSizePixel > 1240 && screenWidthSize < 1000) {
              _aboutMeController.isHtmlAnimated.value = true;
              _aboutMeController.isPythonAnimated.value = true;
            }
            //css and java
            if (screenSizePixel > 1419 && screenWidthSize >= 1000) {
              _aboutMeController.isCssAnimated.value = true;
              _aboutMeController.isJavaAnimated.value = true;
            } else if (screenSizePixel > 1297 && screenWidthSize < 1000) {
              _aboutMeController.isCssAnimated.value = true;
              _aboutMeController.isJavaAnimated.value = true;
            }
            //javascript and c++
            if (screenSizePixel > 1483 && screenWidthSize >= 1000) {
              _aboutMeController.isJavascriptAnimated.value = true;
              _aboutMeController.isCAnimated.value = true;
            } else if (screenSizePixel > 1357 && screenWidthSize < 1000) {
              _aboutMeController.isJavascriptAnimated.value = true;
              _aboutMeController.isCAnimated.value = true;
            }
            //quote part
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                      _aboutMeController.skillPartKey,
                    ]) +
                    182) {
              _aboutMeController.isQuoteAnimated.value = true;
              Timer(const Duration(milliseconds: 1), () {
                _aboutMeController.isLeftSizeQuoteBoxAnimated.value = true;
              });
              Timer(const Duration(milliseconds: 700), () {
                _aboutMeController.isRightSizeQuoteBoxAnimated.value = true;
              });
            }
          } else {
            //for mobile
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                  _aboutMeController.aboutMeAndPhotoPartKey,
                  _aboutMeController.educationTitleKey,
                  _aboutMeController.grationHatKey,
                ])) {
              _aboutMeController.isESLVisible.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                  _aboutMeController.aboutMeAndPhotoPartKey,
                  _aboutMeController.educationTitleKey,
                  _aboutMeController.grationHatKey,
                  _aboutMeController.eslProgramKey
                ])) {
              _aboutMeController.isGeneralEngVisible.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                  _aboutMeController.aboutMeAndPhotoPartKey,
                  _aboutMeController.educationTitleKey,
                  _aboutMeController.grationHatKey,
                  _aboutMeController.eslProgramKey,
                  _aboutMeController.highSchoolKey
                ])) {
              _aboutMeController.isHighSchoolVisible.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                  _aboutMeController.aboutMeAndPhotoPartKey,
                  _aboutMeController.educationTitleKey,
                  _aboutMeController.grationHatKey,
                  _aboutMeController.eslProgramKey,
                  _aboutMeController.highSchoolKey,
                  _aboutMeController.bachelorKey,
                ])) {
              _aboutMeController.isBachelorVisible.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationTitleKey,
                      _aboutMeController.grationHatKey,
                      _aboutMeController.eslProgramKey,
                      _aboutMeController.highSchoolKey,
                      _aboutMeController.bachelorKey,
                    ]) +
                    97) {
              _aboutMeController.isMoreToComeVisible.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    168) {
              _aboutMeController.isDartAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    225) {
              _aboutMeController.isFlutterAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    282) {
              _aboutMeController.isKotlinAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    409) {
              _aboutMeController.isHtmlAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    466) {
              _aboutMeController.isCssAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    523) {
              _aboutMeController.isJavascriptAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    650) {
              _aboutMeController.isFirebaseAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    707) {
              _aboutMeController.isMySQLAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    764) {
              _aboutMeController.isFlaskAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    891) {
              _aboutMeController.isPythonAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    948) {
              _aboutMeController.isJavaAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartKey,
                    ]) +
                    1005) {
              _aboutMeController.isCAnimated.value = true;
            }
            if (screenSizePixel >=
                _aboutMeController.getHeight(list: [
                      _aboutMeController.aboutMeAndPhotoPartKey,
                      _aboutMeController.educationPartMobileKey,
                      _aboutMeController.skillPartMobileKey,
                    ]) +
                    40) {
              _aboutMeController.isQuoteAnimated.value = true;
              Timer(const Duration(milliseconds: 1), () {
                _aboutMeController.isLeftSizeQuoteBoxAnimated.value = true;
              });
              Timer(const Duration(milliseconds: 700), () {
                _aboutMeController.isRightSizeQuoteBoxAnimated.value = true;
              });
            }
          }

          return false;
        },
        child: SizedBox(
          width: screenWidthSize,
          height: screenHeightSize,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabletAndDesktopSize(
                  screenWidth: screenWidthSize,
                  screenHeight: screenHeightSize,
                ),
                MobileSize(
                  screenWidthSize: screenWidthSize,
                  screenHeightSize: screenHeightSize,
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
