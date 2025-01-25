import 'package:cinemax/core/utils/helper.dart';
import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/services/api/popular_movies_services.dart';
import 'package:cinemax/services/api/upcoming_movies_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMoviesController extends GetxController {
  late UpcomingMoviesServices upcomingMoviesServices;

  UpcomingMoviesController() {
    final _apiBaseClientService = ApiBaseClientService();
    upcomingMoviesServices = UpcomingMoviesServices(_apiBaseClientService);
  }
  RxBool isLoading = false.obs;

  var upcomingMoviesData = [].obs;

  Future<void> fetchUpcomingMovies() async {
    isLoading.value = true;
    print("Fetching User Data...");
    final result = await upcomingMoviesServices.fetchUpcomingMovies();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
      
      },
      (success) {
        upcomingMoviesData.assignAll(success);
        infoLog('Fetch Upcoming Movies fetched..: $success');
        isLoading.value = false;
      },
    );
  }
}
