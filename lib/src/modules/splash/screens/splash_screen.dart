import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/modules/home/screens/home_screen.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/black_splash_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    showOverlay(context);
    // Timer(const Duration(milliseconds: 5400), () {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomeScreen(
    //       isFromSplash: 'true',
    //     ),
    //   ),
    // );
    // });
    super.initState();
  }

  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context)!;
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(builder: (context) {
      return const BSplashContainer();
    });
    setState(() {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => overlayState.insert(overlayEntry));
    });

    await Future.delayed(const Duration(milliseconds: 5500));

    setState(() {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
