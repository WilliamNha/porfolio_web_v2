import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDownloadApkButton extends StatelessWidget {
  final GestureTapCallback onTab;
  const CustomDownloadApkButton({
    Key? key,
    required this.screenWidth,
    required this.onTab,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
        margin: EdgeInsets.only(left: screenWidth / 10),
        width: 155,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/android.svg',
              width: 30,
              height: 35,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'DOWNLOAD APK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'android',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
