import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CheckMyWorkButton extends StatefulWidget {
  const CheckMyWorkButton({
    required this.onTap,
    Key? key,
  }) : super(
          key: key,
        );
  final GestureTapCallback onTap;

  @override
  State<CheckMyWorkButton> createState() => _CheckMyWorkButtonState();
}

class _CheckMyWorkButtonState extends State<CheckMyWorkButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: SizedBox(
        width: 200,
        height: 50,
        child: Stack(
          children: [
            AnimatedPositioned(
              left: isHovered ? 10 : 0,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color:
                      isHovered ? Colors.white : Colors.grey.withOpacity(0.2),
                ),
                height: 50,
                width: isHovered ? 180 : 50,
              ),
            ),
            AnimatedPositioned(
              left: isHovered ? 40 : 30,
              top: 18,
              duration: const Duration(milliseconds: 400),
              child: isHovered
                  ? Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.purple,
                      child: const Text(
                        "CHECK MY WORKS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : const Text(
                      "CHECK MY WORKS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
