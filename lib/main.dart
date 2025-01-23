import 'package:cinemax/core/theme/theme.dart';
import 'package:cinemax/services/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

void main() async{
  GoRouter router = AppRouting.router;
   await dotenv.load(fileName: ".env");
  runApp(MyApp(
    route: router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter route;
  const MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (buildContext, orientation, screenType) {
      return GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routerDelegate: AppRouting.router.routerDelegate,
        routeInformationParser: AppRouting.router.routeInformationParser,
        routeInformationProvider: AppRouting.router.routeInformationProvider,
      );
    });
  }
}