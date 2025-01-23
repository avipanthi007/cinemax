import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/core/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  var genreList = {
    "Action": ImageConstants.spidermanGenre,
    "Horror": ImageConstants.horrorGenre,
    "Fantasy": ImageConstants.fantasyGenre,
    "Anime": ImageConstants.animationGenre,
    "Romance": ImageConstants.romanceGenre,
    "Sci-fi": ImageConstants.tomcruiseGenre,
    "Comedy": ImageConstants.lootCase,
    "Adventure": ImageConstants.lifeofPieSea,
  };

  RxMap<dynamic, dynamic> selectedGenres = {}.obs;

  @override
  void initState() {
    super.initState();
    for (var genre in genreList.keys) {
      selectedGenres[genre] = false;
    }
  }

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
              "Genre",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 18.px),
            ),
          ],
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w, top: 8.h),
        child: GridView.builder(
          itemCount: genreList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 14.h,
              crossAxisCount: 2,
              mainAxisSpacing: 2.h,
              crossAxisSpacing: 4.w),
          itemBuilder: (context, index) {
            String genre = genreList.keys.elementAt(index);
            String imagePath = genreList.values.elementAt(index);

            return GestureDetector(
              onTap: () {
                selectedGenres[genre] = !(selectedGenres[genre] ?? false);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    opacity: 0.3,
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        value: selectedGenres[genre] ?? false,
                        onChanged: (bool? value) {
                          selectedGenres[genre] = value ?? false;
                        },
                      ),
                    ),
                    Text(
                      genre,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.textWhiteColor),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
