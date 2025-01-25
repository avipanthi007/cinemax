import 'package:cinemax/core/utils/helper.dart';
import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/services/api/popular_movies_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularMoviesController extends GetxController {
  late PopularMoviesServices popularMoviesServices;

  PopularMoviesController() {
    final _apiBaseClientService = ApiBaseClientService();
    popularMoviesServices = PopularMoviesServices(_apiBaseClientService);
  }
  RxBool isLoading = false.obs;

  var popularMoviesData = [].obs;

  Future<void> fetchPopularMovies() async {
    isLoading.value = true;
    print("Fetching User Data...");
    final result = await popularMoviesServices.fetchPopularMovies();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
       
      },
      (success) {
        popularMoviesData.assignAll(success);
        infoLog('Fetch Popular Movies fetched..: $success');
        isLoading.value = false;
      },
    );
  }
}
