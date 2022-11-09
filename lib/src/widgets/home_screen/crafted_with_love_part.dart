import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CraftedWIthLovePart extends StatelessWidget {
  final bool isOnMobile;
  const CraftedWIthLovePart({
    this.isOnMobile = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isOnMobile ? 300 : 320,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10),
                  child: Text(
                    'Crafted With Love',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 40.0,
                        valueWhen: [
                          Condition.smallerThan(
                            name: DESKTOP,
                            value: isOnMobile ? 28.0 : 31.0,
                          ),
                        ],
                      ).value,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10, right: 0),
                  child: Text(
                    'Here is collection of my recent work.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 18.0,
                        valueWhen: [
                          Condition.smallerThan(
                            name: DESKTOP,
                            value: isOnMobile ? 14.0 : 16.0,
                          ),
                        ],
                      ).value,
                    ),
                  ),
                ),
              ],
            ),
          ),
          isOnMobile ? const SizedBox() : Expanded(child: Container()),
        ],
      ),
    );
  }
}
