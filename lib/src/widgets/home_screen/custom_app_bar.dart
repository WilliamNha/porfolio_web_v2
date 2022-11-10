import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_project_v2/src/widgets/home_screen/custom_shimmer_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    required this.isSelected,
    required this.itemHovered,
    required this.globalKey,
    required this.animationController,
    this.isClickIgnore = false,
    Key? key,
  }) : super(key: key);
  final List itemHovered;
  final int isSelected;
  final GlobalKey<ScaffoldState> globalKey;
  final AnimationController? animationController;
  bool isClickIgnore;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: const Padding(
        padding: EdgeInsets.only(left: 30, top: 10),
        child: Text(
          'PH',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              fontFamily: 'Roboto'),
        ),
      ),
      actions: [
        ResponsiveVisibility(
            visible: false,
            visibleWhen: const [
              Condition.smallerThan(name: TABLET),
            ],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, top: 10),
                child: IgnorePointer(
                  ignoring: widget.isClickIgnore,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        widget.isClickIgnore = true;
                      });
                      widget.globalKey.currentState!.openDrawer();

                      if (widget.animationController!.status ==
                              AnimationStatus.forward ||
                          widget.animationController!.status ==
                              AnimationStatus.completed) {
                        // widget.animationController!.reverse();
                      } else {
                        widget.animationController!.forward();
                        Timer(const Duration(milliseconds: 500), () {
                          setState(() {
                            widget.isClickIgnore = false;
                          });
                        });
                      }
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )),
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [
            Condition.equals(name: TABLET),
            Condition.largerThan(name: TABLET),
          ],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.push(
                        '/home',
                      );
                    },
                    onHover: (value) {
                      setState(() {
                        widget.itemHovered[0] = value;
                      });
                    },
                    child: widget.itemHovered[0] || widget.isSelected == 0
                        ? const CustomShimerText(
                            title: 'Home',
                          )
                        : const Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/about');
                    },
                    onHover: (value) {
                      setState(() {
                        widget.itemHovered[1] = value;
                      });
                    },
                    child: widget.itemHovered[1] || widget.isSelected == 1
                        ? const CustomShimerText(
                            title: 'About',
                          )
                        : const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/contact');
                    },
                    onHover: (value) {
                      setState(() {
                        widget.itemHovered[3] = value;
                      });
                    },
                    child: widget.itemHovered[3] || widget.isSelected == 3
                        ? const CustomShimerText(
                            title: 'Contact',
                          )
                        : const Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   onHover: (value) {
                  //     setState(() {
                  //       widget.itemHovered[4] = value;
                  //     });
                  //   },
                  //   child: AnimatedContainer(
                  //     curve: Curves.ease,
                  //     width: 80,
                  //     duration: const Duration(milliseconds: 200),
                  //     height: 30,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.black, width: 1),
                  //       color:
                  //           widget.itemHovered[4] ? Colors.black : Colors.white,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'Resume',
                  //         style: TextStyle(
                  //             color: widget.itemHovered[4]
                  //                 ? Colors.white
                  //                 : Colors.black,
                  //             fontSize: 15),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
