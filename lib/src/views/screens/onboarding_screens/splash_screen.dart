import 'dart:async';

import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/services/routing/routing.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      context.go(RoutePath.onboardingOne);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 15.h,
              width: 35.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.splashTv),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "CINEMAX",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
