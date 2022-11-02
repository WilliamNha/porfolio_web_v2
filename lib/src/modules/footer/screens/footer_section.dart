import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Get in touch",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 37.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 30.0,
                    ),
                  ],
                ).value!,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Let's build something together :)",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 14.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 12.0,
                    ),
                  ],
                ).value!,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: ResponsiveValue(
                      context,
                      defaultValue: 30.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: DESKTOP,
                          value: 27.0,
                        ),
                      ],
                    ).value!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Phnom Penh, Cambodia",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 13.0,
                        valueWhen: const [
                          Condition.smallerThan(
                            name: DESKTOP,
                            value: 11.0,
                          ),
                        ],
                      ).value!,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: ResponsiveValue(
                      context,
                      defaultValue: 30.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: DESKTOP,
                          value: 27.0,
                        ),
                      ],
                    ).value!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "(+855) 77 560481",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 13.0,
                        valueWhen: const [
                          Condition.smallerThan(
                            name: DESKTOP,
                            value: 11.0,
                          ),
                        ],
                      ).value!,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: ResponsiveValue(
                      context,
                      defaultValue: 30.0,
                      valueWhen: const [
                        Condition.smallerThan(
                          name: DESKTOP,
                          value: 27.0,
                        ),
                      ],
                    ).value!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "panhaheng76@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 13.0,
                        valueWhen: const [
                          Condition.smallerThan(
                            name: DESKTOP,
                            value: 11.0,
                          ),
                        ],
                      ).value!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height / 20,
          ),
          Text(
            "@2022 Built by Panha Heng",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              height: 1.5,
              fontSize: ResponsiveValue(
                context,
                defaultValue: 13.0,
                valueWhen: const [
                  Condition.smallerThan(
                    name: DESKTOP,
                    value: 12.0,
                  ),
                ],
              ).value!,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Built using Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                  fontSize: ResponsiveValue(
                    context,
                    defaultValue: 13.0,
                    valueWhen: const [
                      Condition.smallerThan(
                        name: DESKTOP,
                        value: 12.0,
                      ),
                    ],
                  ).value!,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                'assets/svg/flutter.svg',
                width: ResponsiveValue(
                  context,
                  defaultValue: 17.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 15.0,
                    ),
                  ],
                ).value!,
                height: ResponsiveValue(
                  context,
                  defaultValue: 17.0,
                  valueWhen: const [
                    Condition.smallerThan(
                      name: DESKTOP,
                      value: 15.0,
                    ),
                  ],
                ).value!,
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height / 30,
          ),
        ],
      ),
    );
  }
}
