import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/widgets/about/about_me_detail_text.dart';

class AboutMeAndPhotoPart extends StatelessWidget {
  const AboutMeAndPhotoPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 30, right: 20),
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ABOUT ME',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'OpenSans'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AboutMeDetailText(
                    text:
                        "Hi There! I'm Panha, a Flutter developer and also a passionate self taught programmer based in Cambodia.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AboutMeDetailText(
                    text:
                        "I am a graduated student with ICT major from Rangsit University. I have been developing mobile apps for almost 2 years now. I build high quality apps with elegant UI and robust performance.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AboutMeDetailText(
                    text:
                        "My goal is to become a Full Stack and professional developer and I am willing to take any challenges that can give me new experience and level me up. I will try my best to archive my dreams and goals.",
                  ),
                ],
              ),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(right: 40),
              // color: Colors.red,
              width: double.infinity,
              child: Center(
                child: Container(
                  width: 450,
                  color: Colors.black,
                  child: Image.asset(
                    'assets/images/my_profile.png',
                    height: 360,
                  ),
                ),
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
