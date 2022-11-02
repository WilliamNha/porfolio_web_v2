import 'dart:async';

import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class CustomAnimatedDrawer extends StatefulWidget {
  CustomAnimatedDrawer({
    Key? key,
    required this.animation,
    required this.animationController,
    this.isHomeHover = false,
    this.isAboutHover = false,
    this.isCertificateHover = false,
    this.isContactHover = false,
    this.isClickedIgnore = false,
  }) : super(key: key);

  final Animation<double>? animation;
  final AnimationController? animationController;
  bool isClickedIgnore;
  bool isHomeHover;

  bool isAboutHover;

  bool isCertificateHover;

  bool isContactHover;

  @override
  State<CustomAnimatedDrawer> createState() => _CustomAnimatedDrawerState();
}

class _CustomAnimatedDrawerState extends State<CustomAnimatedDrawer> {
  double fontSize = 35;
  @override
  Widget build(BuildContext context) {
    return CircularRevealAnimation(
      centerOffset: Offset(MediaQuery.of(context).size.width - 50, 20),
      animation: widget.animation!,
      child: SizedBox(
          width: double.infinity,
          child: Drawer(
            backgroundColor: Colors.black,
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        'PH',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 10),
                      child: IgnorePointer(
                        ignoring: widget.isClickedIgnore,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.isClickedIgnore = true;
                            });
                            if (widget.animationController!.status ==
                                    AnimationStatus.forward ||
                                widget.animationController!.status ==
                                    AnimationStatus.completed) {
                              widget.animationController!.reverse();
                              Timer(const Duration(milliseconds: 500), () {
                                setState(() {
                                  widget.isClickedIgnore = false;
                                });
                              });
                            } else {}
                            Future.delayed(const Duration(milliseconds: 600),
                                () {
                              Navigator.pop(context);
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                DrawerButtonPart(
                  isFocusHovered: widget.isHomeHover,
                  fontSize: fontSize,
                  backgroundNumber: '01',
                  foregroundTitle: 'Home',
                  onTab: () {
                    if (widget.animationController!.status ==
                            AnimationStatus.forward ||
                        widget.animationController!.status ==
                            AnimationStatus.completed) {
                      widget.animationController!.reverse();
                    } else {
                      widget.animationController!.forward();
                    }
                    if (widget.isHomeHover) {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        context.go(
                          '/home',
                        );
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                DrawerButtonPart(
                  isFocusHovered: widget.isAboutHover,
                  fontSize: fontSize,
                  backgroundNumber: '02',
                  foregroundTitle: 'About',
                  onTab: () {
                    if (widget.animationController!.status ==
                            AnimationStatus.forward ||
                        widget.animationController!.status ==
                            AnimationStatus.completed) {
                      widget.animationController!.reverse();
                    } else {
                      widget.animationController!.forward();
                    }
                    if (widget.isAboutHover) {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        context.go(
                          '/about',
                        );
                      });
                    }
                  },
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // DrawerButtonPart(
                //   isFocusHovered: widget.isCertificateHover,
                //   fontSize: fontSize,
                //   backgroundNumber: '03',
                //   foregroundTitle: 'Certificate',
                //   widthSize: 165,
                //   onTab: () {
                //     if (widget.animationController!.status ==
                //             AnimationStatus.forward ||
                //         widget.animationController!.status ==
                //             AnimationStatus.completed) {
                //       widget.animationController!.reverse();
                //     } else {
                //       widget.animationController!.forward();
                //     }
                //     if (widget.isCertificateHover) {
                //       Future.delayed(const Duration(milliseconds: 600), () {
                //         Navigator.pop(context);
                //       });
                //     } else {
                //       Future.delayed(const Duration(milliseconds: 600), () {
                //         context.go(
                //           '/certifications',
                //         );
                //       });
                //     }
                //   },
                // ),
                const SizedBox(
                  height: 5,
                ),
                DrawerButtonPart(
                  isFocusHovered: widget.isContactHover,
                  fontSize: fontSize,
                  backgroundNumber: '03',
                  foregroundTitle: 'Contact',
                  widthSize: 130,
                  onTab: () {
                    if (widget.animationController!.status ==
                            AnimationStatus.forward ||
                        widget.animationController!.status ==
                            AnimationStatus.completed) {
                      widget.animationController!.reverse();
                    } else {
                      widget.animationController!.forward();
                    }
                    if (widget.isContactHover) {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        context.go(
                          '/contact',
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class DrawerButtonPart extends StatefulWidget {
  DrawerButtonPart({
    Key? key,
    required this.isFocusHovered,
    required this.fontSize,
    required this.backgroundNumber,
    this.widthSize = 100,
    required this.foregroundTitle,
    required this.onTab,
  }) : super(key: key);

  final bool isFocusHovered;
  final double fontSize;
  final String backgroundNumber;
  double widthSize;
  final String foregroundTitle;
  final GestureTapCallback onTab;

  @override
  State<DrawerButtonPart> createState() => _DrawerButtonPartState();
}

class _DrawerButtonPartState extends State<DrawerButtonPart> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onTab,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: SizedBox(
        width: widget.widthSize,
        height: 80,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.backgroundNumber,
                style: TextStyle(
                    color: isHover || widget.isFocusHovered
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                    fontSize: 80,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 25,
              child: isHover || widget.isFocusHovered
                  ? Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey.withOpacity(0.9),
                      child: Text(
                        widget.foregroundTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.fontSize),
                      ),
                    )
                  : Text(
                      widget.foregroundTitle,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: widget.fontSize),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
