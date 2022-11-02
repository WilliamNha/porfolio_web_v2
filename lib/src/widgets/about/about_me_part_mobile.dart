import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/constants/app_setting_color.dart';
import 'package:portfolio_project_v2/src/widgets/about/about_me_detail_text.dart';

class AboutMePartMobile extends StatelessWidget {
  const AboutMePartMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 90,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
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
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'ABOUT ME',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: 'Roboto'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AboutMeDetailText(
              fontSize: 16,
              text:
                  "Hi There! I'm Panha, a Flutter developer and also a passionate self taught programmer based in Cambodia.",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AboutMeDetailText(
              fontSize: 16,
              text:
                  "I am a graduated student with ICT major from Rangsit University. I have been developing mobile apps for almost 2 years now. I build high quality apps with elegant UI and robust performance.",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AboutMeDetailText(
              fontSize: 16,
              text:
                  "My goal is to become a Full Stack and professional developer and I am willing to take any challenges that can give me new experience and level me up. I will try my best to archive my dreams and goals.",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
