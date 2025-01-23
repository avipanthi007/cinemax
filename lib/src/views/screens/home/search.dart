import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:cinemax/src/views/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> sort = [
    "All",
    "Comedy",
    "Animation",
    "Documentary",
  ];
  RxInt isSelected = 0.obs;
  final isSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 8.h,
        title: CustomTextField(
          controller: isSearch,
          margin: EdgeInsets.all(0),
          label: "Type title, categories, years, etc",
          prefix: Icon(Icons.search, color: AppColors.grey),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      body: isSearch.text.isNotEmpty
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                          height: 24.h,
                          width: 35.w,
                          child: Image.asset(
                            ImageConstants.spiderMan,
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
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            SizedBox(width: 4),
                            Text(
                              "4.0",
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
                                .copyWith(color: AppColors.white, fontSize: 10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text(
                        'Spider-Man No Way.. ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 16.px),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      kRepeatedRow(context,
                          icon: Icons.calendar_month, title: "2021"),
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
                              icon: Icons.receipt_long_sharp, title: "Action"),
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
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 3.h),
                    Text(
                      'Today',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16.px),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                  height: 24.h,
                                  width: 35.w,
                                  child: Image.asset(
                                    ImageConstants.spiderMan,
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
                                      "4.0",
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
                                            color: AppColors.white,
                                            fontSize: 10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Text(
                                'Spider-Man No Way.. ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 16.px),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              kRepeatedRow(context,
                                  icon: Icons.calendar_month, title: "2021"),
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
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommend for you',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16.px),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('See All',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildMovieCard(
                              onTap: () {},
                              title: 'The Jungle Waiting',
                              genre: 'Action',
                              rating: 4.5,
                              img: ImageConstants.jungleWaiting),
                          _buildMovieCard(
                              onTap: () {},
                              title: 'Life of PI',
                              genre: 'Action',
                              rating: 4.5,
                              img: ImageConstants.lifeOfPie),
                          _buildMovieCard(
                              onTap: () {},
                              title: 'DOt',
                              genre: 'Action',
                              rating: 4.2,
                              img: ImageConstants.megician),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  image: AssetImage(img), // Replace with image
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
