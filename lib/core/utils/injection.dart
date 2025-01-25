import 'package:cinemax/core/utils/constants/api_constants.dart';
import 'package:cinemax/src/controllers/now_playing_controller.dart';
import 'package:cinemax/src/controllers/popular_movies_controller.dart';
import 'package:cinemax/src/controllers/upcoming_movies_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void inject() {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    Get.lazyPut<Dio>(() => dio);

    Get.lazyPut(() => PopularMoviesController());
    Get.lazyPut(() => UpcomingMoviesController());
    Get.lazyPut(() => NowPlayingController());
  }
}
