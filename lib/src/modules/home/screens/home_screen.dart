import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/main.dart';
import 'package:portfolio_project_v2/src/modules/footer/screens/footer_section.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_animated_drawer.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_transition_container.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_app_bar.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/introduction_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isFromSplash = 'false'});
  final String? isFromSplash;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showAppBar = false;
  int defaultSizeBox20 = 20;
  AnimationController? animationController;
  Animation<double>? animation;
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
    if (widget.isFromSplash != 'true' || widget.isFromSplash == null) {
      showOverlayTransHomeScreen(context);
    }

    super.initState();
  }

  showOverlayTransHomeScreen(BuildContext context) async {
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
  double paddingSize = 55;
  double fontSize = 35;
  bool isHomeHover = false;
  bool isAboutHover = false;
  bool isCertificateHover = false;
  bool isContactHover = false;
  var isClickIgnore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CustomAnimatedDrawer(
          isClickedIgnore: isClickIgnore,
          isHomeHover: true,
          animation: animation,
          animationController: animationController),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            animationController: animationController,
            globalKey: _key,
            isSelected: 0,
            itemHovered: itemHovered,
          )),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const IntroductionPart(),
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.white,
              ),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
