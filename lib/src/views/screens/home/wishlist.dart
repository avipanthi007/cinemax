import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              "Wishlist",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 18.px),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          kRepeatedFavoriteContainer(context, isDownloading: true),
          kRepeatedFavoriteContainer(context, isDownloading: true),
          kRepeatedFavoriteContainer(context, isDownloading: true),
        ],
      ),
    );
  }

  Container kRepeatedFavoriteContainer(BuildContext context,
      {required bool isDownloading}) {
    return Container(
      height: 15.h,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.softColor, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
              width: 35.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: isDownloading
                      ? DecorationImage(
                          opacity: 0.2,
                          image: AssetImage(ImageConstants.spiderMultiverse),
                          fit: BoxFit.fill)
                      : DecorationImage(
                          image: AssetImage(ImageConstants.spiderMultiverse),
                          fit: BoxFit.fill)),
              child: isDownloading
                  ? Center(
                      child: Image.asset(
                        ImageConstants.stackplay,
                        scale: 4,
                      ),
                    )
                  : null),
          SizedBox(width: 3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Action",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColors.textGreyColor),
              ),
              Text("Spider-Man No Way\nHome",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.px,
                      )),
              Row(
                children: [
                  Text(
                    "Movie",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.px,
                        ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "4.0".toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(Icons.favorite, color: Colors.red)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
