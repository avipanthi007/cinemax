import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  bool emptyList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Downloads",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 18.px),
              ),
            ],
          ),
        ),
        body: emptyList
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 20.w,
                      child: Image.asset(
                        ImageConstants.folder,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text("There is no movie yet!",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18.px,
                            )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Find your movie by Type title,\ncategories, years, etc ",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.px,
                          ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    kRepeatedDownloadContainer(context, isDownloading: true),
                    kRepeatedDownloadContainer(context, isDownloading: false),
                  ],
                ),
              ));
  }

  Container kRepeatedDownloadContainer(BuildContext context,
      {required bool isDownloading}) {
    return Container(
      height: 15.h,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.softColor, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
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
                        ImageConstants.chartDownload,
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
              SizedBox(
                child: Text("Spider-Man No Way\nHome",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.px,
                        )),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                  children: isDownloading
                      ? [
                          Icon(
                            Icons.file_download_outlined,
                            size: 17,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "1.25 of 1.78 GB | 75%",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.px,
                                ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                        ]
                      : [
                          Text(
                            "Action | 1.78 GB",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.px,
                                ),
                          ),
                        ])
            ],
          )
        ],
      ),
    );
  }
}
