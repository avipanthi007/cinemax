import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/main.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:cinemax/src/views/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.onboardingBack),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            KOnbordingContainer(
                titleText:
                    "The biggest international \nand local film streaming",
                currentIndex: 0,
                onTap: () {
                  context.go(RoutePath.onboardingTwo);
                }),
          ],
        ),
      ),
    );
  }
}
