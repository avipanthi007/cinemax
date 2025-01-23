import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/main.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:cinemax/src/views/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 4.w, top: 7.h, bottom: 6.h),
            child: Image.asset(ImageConstants.onboardingTwo),
          ),
          KOnbordingContainer(
              titleText: "Our service brings together\nyour favorite series",
              currentIndex: 2,
              onTap: () {
                context.go(RoutePath.bottomBar);
              })
        ],
      ),
    );
  }
}
