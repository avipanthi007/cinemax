import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/api_constants.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/main.dart';
import 'package:cinemax/services/routing/routing_name.dart';
import 'package:cinemax/src/controllers/now_playing_controller.dart';
import 'package:cinemax/src/controllers/popular_movies_controller.dart';
import 'package:cinemax/src/controllers/upcoming_movies_controller.dart';
import 'package:cinemax/src/models/now_playing_model.dart';
import 'package:cinemax/src/models/popular_movies_model.dart';
import 'package:cinemax/src/models/upcoming_movies.dart';
import 'package:cinemax/src/views/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final popularMovies = Get.find<PopularMoviesController>();
  final upcomingMovies = Get.find<UpcomingMoviesController>();
  //final nowPlaying = Get.find<NowPlayingController>();
  List movieImages = [
    ImageConstants.lootCase,
    ImageConstants.wakanda,
    ImageConstants.lifeofPieSea,
  ];
  List<String> sort = [
    "All",
    "Genre",
    "Comedy",
    "Animation",
    "Documentary",
  ];
  var currentIndex = 0.obs;
  RxInt isSelected = 0.obs;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 8.h,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.softColor,
              backgroundImage: AssetImage(ImageConstants.userProfile),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Smith',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Let's stream your favorite movie",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            )
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.softColor,
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                context.push(RoutePath.wishlist);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                margin: EdgeInsets.all(0),
                label: "Search a title...",
                prefix: Icon(Icons.search, color: AppColors.grey),
                suffix: Icon(Icons.tune, color: AppColors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              SizedBox(height: 3.h),
              // Column(
              //   children: nowPlaying.nowPlayingMoviesData.isEmpty ||
              //           nowPlaying.isLoading.value
              //       ? [
              //           Center(
              //             child: CircularProgressIndicator(),
              //           )
              //         ]
              //       : [
              //           SizedBox(
              //             height: 20.h,
              //             child: CarouselSlider.builder(
              //               itemCount: nowPlaying.nowPlayingMoviesData.length,
              //               options: CarouselOptions(
              //                 height: 20.h,
              //                 autoPlay: false,
              //                 onPageChanged: (index, reason) {
              //                   currentIndex.value = index;
              //                 },
              //               ),
              //               itemBuilder: (context, index, realIndex) {
              //                 var nowData =
              //                     nowPlaying.nowPlayingMoviesData[index];
              //                 return Container(
              //                   margin: EdgeInsets.symmetric(horizontal: 10),
              //                   width: 80.w,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(16),
              //                     image: DecorationImage(
              //                       image: NetworkImage(ApiConstants.imageUrl +
              //                           (nowData.results[index].posterPath ??
              //                               "")),
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                   child: Stack(
              //                     children: [
              //                       Positioned(
              //                         bottom: 20,
              //                         left: 20,
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Text(
              //                               nowData.results[index].title,
              //                               style: TextStyle(
              //                                   color: Colors.white,
              //                                   fontSize: 16,
              //                                   fontWeight: FontWeight.bold),
              //                             ),
              //                             Text(
              //                               'On March 2, 2022',
              //                               style: TextStyle(
              //                                   color: Colors.grey,
              //                                   fontSize: 12),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             ),
              //           ),
              //           SizedBox(height: 2.h),
              //           Obx(() {
              //             return Center(
              //               child: AnimatedSmoothIndicator(
              //                 activeIndex: currentIndex.value,
              //                 count: nowPlaying.nowPlayingMoviesData.length,
              //                 effect: ExpandingDotsEffect(
              //                   activeDotColor: AppColors.primaryColor,
              //                   dotColor: Colors.grey,
              //                   dotHeight: 5.0,
              //                   dotWidth: 5.0,
              //                   expansionFactor: 2.5,
              //                   spacing: 4.0,
              //                 ),
              //               ),
              //             );
              //           }),
              //         ],
              // ),
             
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.px),
              ),
              SizedBox(height: 10),
              Container(
                height: 5.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sort.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => _buildCategoryChip(
                        onTap: () {
                          isSelected.value = index;
                          if (index == 1) {
                            context.push(RoutePath.genre);
                          }
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
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16.px),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(RoutePath.popularMoviesPage);
                    },
                    child: Text('See All',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Obx(
                () => SizedBox(
                  height: 30.h,
                  child: popularMovies.popularMoviesData.isEmpty ||
                          popularMovies.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            PopularMoviesModel data =
                                popularMovies.popularMoviesData[index];
                            return _buildMovieCard(
                                title: data.title.toString(),
                                onTap: () {},
                                genre: "Action",
                                rating:
                                    double.parse(data.voteAverage.toString()),
                                img: ApiConstants.imageUrl +
                                    data.posterPath.toString());
                          }),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16.px),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(RoutePath.upcoming);
                    },
                    child: Text('See All',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Obx(
                () => SizedBox(
                  height: 30.h,
                  child: upcomingMovies.upcomingMoviesData.isEmpty ||
                          upcomingMovies.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            Movie data =
                                upcomingMovies.upcomingMoviesData[index];
                            return _buildMovieCard(
                              title: data.title ?? "Unknown Title",
                              onTap: () {},
                              genre: "Action",
                              rating: data.voteAverage ?? 0.0,
                              img: ApiConstants.imageUrl +
                                  (data.posterPath ?? ""),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          child: Text(
            label,
            style:
                Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        ),
      ),
    );
  }

  Widget _buildMovieCard(
      {required String title,
      required Function() onTap,
      required String genre,
      required double rating,
      required String img}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35.w,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 23.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(img), // Replace with image
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: 2.w, top: 1.h),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.white,
                        fontSize: 14.px),
                  ),
                  SizedBox(height: 4),
                  Text(
                    genre,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
