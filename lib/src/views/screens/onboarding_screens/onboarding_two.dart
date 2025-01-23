import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/main.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:cinemax/src/views/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softColor,
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Image.asset(ImageConstants.onboardingOne),
          ),
          KOnbordingContainer(
              titleText: "Offers ad-free viewing of\nhigh quality",
              currentIndex: 1,
              onTap: () {
                context.go(RoutePath.onboardingThree);
              })
        ],
      ),
    );
  }
}
