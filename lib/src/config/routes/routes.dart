import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_project_v2/src/modules/about/screens/about_screen.dart';
import 'package:portfolio_project_v2/src/modules/contact/screens/contact_screen.dart';
import 'package:portfolio_project_v2/src/modules/home/screens/home_screen.dart';
import 'package:portfolio_project_v2/src/modules/home/screens/project_detail_screen.dart';
import 'package:portfolio_project_v2/src/modules/splash/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        name: 'Home',
        path: '/home',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithDefaultTransition(
              context: context, state: state, child: const HomeScreen());
        }),
    GoRoute(
      name: 'About',
      path: '/about',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const AboutScreen(),
      ),
    ),
    GoRoute(
      name: 'Contact',
      path: '/contact',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ContactScreen(),
      ),
    ),
    GoRoute(
      name: 'ProjectDetail',
      path: '/project_detail',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ProjectDetailScreen(),
      ),
    ),
  ],
  initialLocation: '/',
);

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 1000),
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
            opacity: animation,
            alwaysIncludeSemantics: true,
            child: DelayedDisplay(
              fadingDuration: const Duration(microseconds: 500),
              delay: const Duration(milliseconds: 1000),
              child: child,
            )),
  );
}
