import 'package:flutter/material.dart';

class AnimatedTransContainer extends StatefulWidget {
  const AnimatedTransContainer({super.key});

  @override
  State<AnimatedTransContainer> createState() => _AnimatedTransContainerState();
}

class _AnimatedTransContainerState extends State<AnimatedTransContainer> {
  bool startAnimation = false;
  bool isAtRight = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        startAnimation = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      setState(() {
        isAtRight = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity / 2,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            left: isAtRight ? null : 0,
            right: isAtRight ? 0 : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              height: MediaQuery.of(context).size.height,
              width: isAtRight
                  ? 0
                  : startAnimation
                      ? MediaQuery.of(context).size.width
                      : 0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
