import 'package:cinemax/core/utils/helper.dart';
import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/services/api/now_playing_services.dart';
import 'package:cinemax/services/api/popular_movies_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  late NowPlayingServices nowPlayingServices;

  NowPlayingController() {
    final _apiBaseClientService = ApiBaseClientService();
    nowPlayingServices = NowPlayingServices(_apiBaseClientService);
  }
  RxBool isLoading = false.obs;

  var nowPlayingMoviesData = [].obs;

  Future<void> fetchNowPlayingMovies() async {
    isLoading.value = true;
    print("Fetching Now Playing Data...");
    final result = await nowPlayingServices.fetchNowPlayingMovies();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed  Now Playing: $failure');
       
      },
      (success) {
        nowPlayingMoviesData.assignAll(success);
        infoLog('Fetch  Now Playing Movies fetched..: $success');
        isLoading.value = false;
      },
    );
  }
}
