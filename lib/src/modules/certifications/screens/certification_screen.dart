import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/main.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_animated_drawer.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/animated_transition_container.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_app_bar.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    showOverlayTransCertificationScreen(context);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    super.initState();
  }

  showOverlayTransCertificationScreen(BuildContext context) async {
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
    return Scaffold(
      key: _key,
      drawer: CustomAnimatedDrawer(
          isCertificateHover: true,
          animation: animation,
          animationController: animationController),
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            animationController: animationController,
            globalKey: _key,
            itemHovered: itemHovered,
            isSelected: 2,
          )),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [],
        ),
      ),
    );
  }
}
