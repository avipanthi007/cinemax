import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KOnbordingContainer extends StatelessWidget {
  final String titleText;

  final int currentIndex;
  final Function()? onTap;
  const KOnbordingContainer(
      {super.key,
      required this.titleText,
      required this.currentIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 100.w,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            //padding: EdgeInsets.all(20),
            height: 26.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleText,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 18.px,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Semper in cursus magna et eu\nvarius nunc adipiscing. Elementum\njusto, laoreet id sem semper\nparturient. ",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 14.px,
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Row(
                    //mainAxisAlignment: MainA,
                    children: List.generate(3, (indexDots) {
                  return Container(
                    margin: EdgeInsets.only(left: 8),
                    width: currentIndex == indexDots ? 25 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: 1 == indexDots
                            ? AppColors.primaryColor
                            : AppColors.primaryColor),
                  );
                })),
                Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Image.asset(
                    ImageConstants.route,
                    height: 7.h,
                    width: 14.w,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
