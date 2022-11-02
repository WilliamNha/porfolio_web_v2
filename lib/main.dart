import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_project_v2/src/config/routes/routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

List itemHovered = [false, false, false, false, false, false];
// Create a key

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: ((context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
              ])),
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Panha Heng',
      theme: ThemeData(fontFamily: 'Roboto'),
    );
  }
}
