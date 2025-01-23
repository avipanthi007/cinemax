import 'package:cinemax/services/routing/routing_name.dart';
import 'package:cinemax/src/views/screens/bottom_bar.dart';
import 'package:cinemax/src/views/screens/home/genre.dart';
import 'package:cinemax/src/views/screens/home/home_page.dart';
import 'package:cinemax/src/views/screens/home/upcoming.dart';
import 'package:cinemax/src/views/screens/home/view_page.dart';
import 'package:cinemax/src/views/screens/home/view_upcoming_details.dart';
import 'package:cinemax/src/views/screens/home/wishlist.dart';
import 'package:cinemax/src/views/screens/onboarding_screens/onboarding_one.dart';
import 'package:cinemax/src/views/screens/onboarding_screens/onboarding_three.dart';
import 'package:cinemax/src/views/screens/onboarding_screens/onboarding_two.dart';
import 'package:cinemax/src/views/screens/onboarding_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouting {
  static final GoRouter router = GoRouter(
      initialLocation: RoutePath.splashScreen,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: SplashScreen());
      },
      routes: [
        GoRoute(
            path: RoutePath.splashScreen,
            builder: (context, state) {
              return const SplashScreen();
            }),
        GoRoute(
            path: RoutePath.onboardingOne,
            builder: (context, state) {
              return const OnboardingOne();
            }),
        GoRoute(
            path: RoutePath.onboardingTwo,
            builder: (context, state) {
              return const OnboardingTwo();
            }),
        GoRoute(
            path: RoutePath.onboardingThree,
            builder: (context, state) {
              return const OnboardingThree();
            }),
        GoRoute(
            path: RoutePath.homeScreen,
            builder: (context, state) {
              return const HomeScreen();
            }),
        GoRoute(
            path: RoutePath.bottomBar,
            builder: (context, state) {
              return const BottomBar();
            }),
        GoRoute(
            path: RoutePath.viewPage,
            builder: (context, state) {
              return const ViewPage();
            }),
        GoRoute(
            path: RoutePath.genre,
            builder: (context, state) {
              return const Genre();
            }),
        GoRoute(
            path: RoutePath.wishlist,
            builder: (context, state) {
              return const Wishlist();
            }),
        GoRoute(
            path: RoutePath.upcoming,
            builder: (context, state) {
              return const Upcoming();
            }),
        GoRoute(
            path: RoutePath.viewUpcomingDetails,
            builder: (context, state) {
              return const ViewUpcomingDetails();
            }),
      ]);
}
