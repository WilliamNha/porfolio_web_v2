import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BSplashContainer extends StatefulWidget {
  const BSplashContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<BSplashContainer> createState() => _BSplashContainerState();
}

class _BSplashContainerState extends State<BSplashContainer> {
  bool isStartAnimated = false;
  bool selected = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        selected = true;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isStartAnimated = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 0,
              duration: const Duration(milliseconds: 1000),
              width: selected
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width,
              height: selected ? 0 : MediaQuery.of(context).size.height / 2,
              curve: Curves.linear,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: 0,
              duration: const Duration(milliseconds: 1000),
              width: selected
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width,
              height: selected ? 0 : MediaQuery.of(context).size.height / 2,
              curve: Curves.linear,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            Positioned(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      FadeAnimatedText('Panha Heng',
                          duration: const Duration(milliseconds: 4000),
                          fadeInEnd: 0.5,
                          fadeOutBegin: 0.8,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 1800),
                      color: Colors.white,
                      height: 1,
                      width: isStartAnimated
                          ? MediaQuery.of(context).size.width
                          : 50,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
