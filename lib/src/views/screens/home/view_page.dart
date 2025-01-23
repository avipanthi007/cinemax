import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:share_plus/share_plus.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 80.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              opacity: 0.2,
              image: AssetImage(
                ImageConstants.spiderMan,
              ),
              fit: BoxFit.cover,
            )),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 6.h, right: 8.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          height: 6.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              color: AppColors.softColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Spider-Man No Way..",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 18.px),
                      ),
                      Spacer(),
                      Container(
                        height: 6.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                            color: AppColors.softColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.spiderMan))),
                  height: 45.h,
                  width: 60.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    kRepeatedRow(context,
                        icon: Icons.calendar_month, title: "2021"),
                    kRepeatedRow(context,
                        icon: Icons.watch_later, title: "148 Minutes"),
                    kRepeatedRow(context,
                        icon: Icons.receipt_long_sharp, title: "Action")
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 4.h,
                  width: 16.w,
                  decoration: BoxDecoration(
                      color: AppColors.softColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "4.0",
                        style: TextStyle(color: Colors.white, fontSize: 14.px),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.white, size: 20),
                          SizedBox(width: 4),
                          Text(
                            "Play",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.px),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      height: 6.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                          color: AppColors.softColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.file_download_outlined,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share("Title: Spider Man");
                      },
                      child: Container(
                          height: 6.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              color: AppColors.softColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            ImageConstants.share,
                            scale: 3.5,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Most Popular',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16.px),
                              ),
                            ],
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 12.h,
                        child: Text(
                          "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. More",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 13.px),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Cast and Crew',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16.px),
                              ),
                            ],
                          ),
                          Spacer()
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget kRepeatedRow(BuildContext context,
      {required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: AppColors.grey,
        ),
        SizedBox(width: 4),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12.px),
        ),
        SizedBox(
          width: 2.w,
        ),
      ],
    );
  }

}
