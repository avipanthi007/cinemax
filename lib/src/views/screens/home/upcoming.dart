import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<String> sort = [
    "All",
    "Comedy",
    "Animation",
    "Documentary",
  ];
  RxInt isSelected = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: 5.h,
                width: 10.w,
                decoration: BoxDecoration(
                    color: AppColors.softColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              "Upcoming Movie",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 18.px),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 1.h),
              SizedBox(
                height: 5.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sort.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => _buildCategoryChip(
                        onTap: () {
                          isSelected.value = index;
                        },
                        label: sort[index],
                        bgColor: isSelected.value == index
                            ? AppColors.softColor
                            : AppColors.black,
                        color: isSelected.value == index
                            ? AppColors.primaryColor
                            : AppColors.white,
                      ),
                    );
                  },
                ),
              ),
              kRepeatedUpcomingContainer(context, ontap: () {
                context.push(RoutePath.viewUpcomingDetails);
              },
                  img: ImageConstants.batman,
                  movieName: 'The Batman',
                  date: "March 2,2022"),
              kRepeatedUpcomingContainer(context,
                  img: ImageConstants.wakanda,
                  movieName: 'Black Panther: Wakanda Forever',
                  date: "November 11, 2022 "),
              kRepeatedUpcomingContainer(context,
                  img: ImageConstants.cartoon,
                  movieName: 'The Batman',
                  date: "March 2,2022"),
            ],
          ),
        ),
      ),
    );
  }

  Widget kRepeatedUpcomingContainer(BuildContext context,
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

  Widget _buildCategoryChip(
      {required String label,
      Function()? onTap,
      required Color bgColor,
      required Color color}) {
    return Padding(
      padding: EdgeInsets.only(right: 1.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
          child: Text(
            label,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
