import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/src/models/now_playing_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NowPlayingServices {
  final ApiBaseClientService _apiBaseClientService;

  NowPlayingServices(this._apiBaseClientService);

  Future<Either<String, List<NowPlayingModel>>> fetchNowPlayingMovies() async {
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "now_playing?language=en-US&page=1",
        method: 'GET',
      );

      debugPrint('Fetch success: ${response.data}');

      if (response.data != null && response.data["results"] != null) {
        final moviesList = response.data["results"] as List<dynamic>;
        final nowPlayingMovies = moviesList
            .map((movie) =>
                NowPlayingModel.fromJson(movie as Map<String, dynamic>))
            .toList();

        debugPrint('Fetched Now Playing movie data: $nowPlayingMovies');

        return Right(nowPlayingMovies);
      } else {
        final errorMessage =
            response.data?["message"] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetch Now Playing Movies: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

}
