import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/api_constants.dart';
import 'package:cinemax/src/controllers/popular_movies_controller.dart';
import 'package:cinemax/src/models/popular_movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MostPopularMovies extends StatefulWidget {
  const MostPopularMovies({super.key});

  @override
  State<MostPopularMovies> createState() => _MostPopularMoviesState();
}

class _MostPopularMoviesState extends State<MostPopularMovies> {
  final popularMovies = Get.find<PopularMoviesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: popularMovies.popularMoviesData.isEmpty ||
              popularMovies.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: popularMovies.popularMoviesData.length,
              itemBuilder: (context, index) {
                PopularMoviesModel data =
                    popularMovies.popularMoviesData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: 24.h,
                                width: 35.w,
                                child: Image.network(
                                  ApiConstants.imageUrl +
                                      data.posterPath.toString(),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            top: 1.h,
                            right: 2.w,
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    data.voteAverage.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.px),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 3.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  "Premium",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: AppColors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                data.title.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 16.px,
                                        overflow: TextOverflow.visible),
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            kRepeatedRow(context,
                                icon: Icons.calendar_month, title: "2022"),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            kRepeatedRow(
                              container: true,
                              context,
                              icon: Icons.watch_later,
                              title: "148 Minutes",
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Row(
                              children: [
                                kRepeatedRow(context,
                                    icon: Icons.receipt_long_sharp,
                                    title: "Action"),
                                Text("| Movie",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 16.px))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }

  Widget kRepeatedRow(BuildContext context,
      {required IconData icon, required String title, bool container = false}) {
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
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12.px),
        ),
        SizedBox(
          width: 2.w,
        ),
        if (container == true)
          Container(
            height: 3.h,
            width: 16.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "PG-13",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.px),
            )),
          ),
      ],
    );
  }
}
