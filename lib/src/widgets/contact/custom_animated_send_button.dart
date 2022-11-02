import 'package:flutter/material.dart';

class CustomAnimatedSendButton extends StatefulWidget {
  const CustomAnimatedSendButton({
    Key? key,
    required this.onTab,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;
  final GestureTapCallback onTab;

  @override
  State<CustomAnimatedSendButton> createState() =>
      _CustomAnimatedSendButtonState();
}

class _CustomAnimatedSendButtonState extends State<CustomAnimatedSendButton> {
  var isButtonHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onHover: (value) {
            setState(() {
              isButtonHover = value;
            });
          },
          onTap: widget.onTab,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black)),
            margin: const EdgeInsets.only(right: 0),
            child: SizedBox(
              width: 120,
              height: 40,
              child: Stack(
                children: [
                  AnimatedPositioned(
                      right: 0,
                      duration: const Duration(milliseconds: 250),
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        duration: const Duration(milliseconds: 250),
                        width: isButtonHover ? 0 : 120,
                        height: 40,
                      )),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send',
                        style: TextStyle(
                            fontSize: widget.screenWidth > 1000 ? 15 : 13,
                            fontWeight: FontWeight.bold,
                            color: isButtonHover ? Colors.black : Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/telegram.png',
                        width: widget.screenWidth > 1000 ? 15 : 13,
                        height: widget.screenWidth > 1000 ? 15 : 13,
                        color: isButtonHover ? Colors.black : Colors.white,
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
