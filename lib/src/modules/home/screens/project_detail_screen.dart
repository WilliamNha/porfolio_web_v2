import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/main.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/modules/footer/screens/footer_section.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_transition_container.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_app_bar.dart';
import 'package:portfolio_project_v2/src/widgets/project_detail/custom_download_apk_button.dart';
import 'package:portfolio_project_v2/src/widgets/project_detail/custom_platform_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/home_screen/custom_animated_drawer.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var isClickIgnore = false;

  showOverlayTransProjectDetail(BuildContext context) async {
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

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    showOverlayTransProjectDetail(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // debugPrint('$screenWidth');
    return Scaffold(
      key: _key,
      drawer: CustomAnimatedDrawer(
          isClickedIgnore: isClickIgnore,
          animation: animation,
          animationController: animationController),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            animationController: animationController,
            globalKey: _key,
            isSelected: 4,
            itemHovered: itemHovered,
          )),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: AppColor.primaryBackgroundColor,
            width: double.infinity,
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40, top: 40, left: 20, right: 20),
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
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Image.asset(
                                  'assets/images/work/shop_easy/shoes.png',
                                )),
                          ),
                          screenWidth < 800
                              ? const SizedBox()
                              : Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Image.asset(
                                        'assets/images/work/shop_easy/wallet.png',
                                      )),
                                ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: screenWidth / 10,
              right: screenWidth / 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 50),
                  child: Text(
                    'About the project',
                    style: TextStyle(
                        fontSize: screenWidth < 1000 ? 33 : 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    'Shop Ez is an ecommerce app built using Flutter. It has beautiful and attractive UI desgin. This is personal project only.',
                    style: TextStyle(
                        height: 2,
                        color: Colors.black,
                        fontSize: screenWidth < 1000 ? 15 : 16),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomPlatformText(
                      screenWidth: screenWidth,
                      title: 'Platform',
                      detail: 'iOS/Android',
                    ),
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    CustomPlatformText(
                      screenWidth: screenWidth,
                      title: 'Category',
                      detail: 'Ecommerce',
                    ),
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    CustomPlatformText(
                      screenWidth: screenWidth,
                      title: 'Designer',
                      detail: 'Panha Heng',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth / 10,
            ),
            child: CustomPlatformText(
                screenWidth: screenWidth,
                detail: 'Dart & Flutter',
                title: 'Tool Used'),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomDownloadApkButton(
            screenWidth: screenWidth,
            onTab: () async {
              final url = Uri.parse(
                  'https://drive.google.com/file/d/1fFkwgrkEMFyYnMmUkAM9Z5UuIpeGeBq-/view?usp=share_link');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          const SizedBox(
            height: 80,
          ),
          const FooterSection(),
        ])),
      ),
    );
  }
}
