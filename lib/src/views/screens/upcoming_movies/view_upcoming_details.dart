import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ViewUpcomingDetails extends StatefulWidget {
  const ViewUpcomingDetails({super.key});

  @override
  State<ViewUpcomingDetails> createState() => _ViewUpcomingDetailsState();
}

class _ViewUpcomingDetailsState extends State<ViewUpcomingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 6.h, right: 6.w),
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
                      "Trailer",
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
              SizedBox(
                height: 2.h,
              ),
              kRepeatedViewContainer(context,
                  img: ImageConstants.catWomen,
                  movieName: 'The Batman',
                  date: "Release Date: March 2,2022"),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Synopsis',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.px),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 100.w,
                height: 16.h,
                child: Text(
                  "THE BATMAN is an edgy, action-packed thriller that depicts Batman in his early years, struggling to balance rage with righteousness as he investigates a disturbing mystery that has terrorized Gotham. Robert Pattinson delivers a raw, intense portrayal of Batman as a disillusioned, desperate vigilante awakened by the realization.. More",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13.px,
                      color: AppColors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Cast and Crew',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.px),
              ),
              SizedBox(
                height: 7.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    kRepeatedCasrCrewBox(context),
                    SizedBox(
                      width: 2.h,
                    ),
                    kRepeatedCasrCrewBox(context),
                    SizedBox(
                      width: 2.h,
                    ),
                    kRepeatedCasrCrewBox(context)
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Galery',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.px),
              ),
              Row(
                children: [
                  kRepeatedgaleryBox(img: ImageConstants.viewOne),
                  kRepeatedgaleryBox(img: ImageConstants.viewTwo),
                  kRepeatedgaleryBox(img: ImageConstants.viewThree),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container kRepeatedgaleryBox({required String img}) {
    return Container(
      margin: EdgeInsets.only(top: 4.h, right: 5.w),
      height: 15.h,
      width: 26.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
    );
  }

  Padding kRepeatedCasrCrewBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, right: 2.w),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            child: Image.asset(ImageConstants.userProfile),
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Matt Reeves",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14.px),
              ),
              Text(
                "Directors",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 10.px),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget kRepeatedViewContainer(BuildContext context,
      {required String img,
      required String movieName,
      required String date,
      Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover)),
              child: Center(
                  child: Image.asset(
                ImageConstants.stackplay,
                scale: 3,
              )),
            ),
            SizedBox(height: 1.5.h),
            Text(
              movieName,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16.px),
            ),
            Row(
              children: [
                kRepeatedRow(context, icon: Icons.calendar_month, title: date),
                Text(
                  '|',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 20.px),
                ),
                SizedBox(
                  width: 1.w,
                ),
                kRepeatedRow(context,
                    icon: Icons.receipt_long_sharp, title: "Action"),
              ],
            ),
          ],
        ),
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
