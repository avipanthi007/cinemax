import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/src/models/popular_movies_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class PopularMoviesServices {
  final ApiBaseClientService _apiBaseClientService;

  PopularMoviesServices(this._apiBaseClientService);

  Future<Either<String, List<PopularMoviesModel>>> fetchPopularMovies() async {
    try {
      final response = await _apiBaseClientService.request(
        endpoint: "popular?language=en-US&page=1",
        method: 'GET',
      );

      debugPrint('Fetch success: ${response.data}');

      if (response.data != null && response.data["results"] != null) {
        final moviesList = response.data["results"] as List<dynamic>;
        final popularMovies = moviesList
            .map((movie) =>
                PopularMoviesModel.fromJson(movie as Map<String, dynamic>))
            .toList();

        debugPrint('Fetched movie data: $popularMovies');

        return Right(popularMovies);
      } else {
        final errorMessage =
            response.data?["message"] ?? "Something went wrong!";
        return Left(errorMessage);
      }
    } catch (e, stackTrace) {
      debugPrint('Error in fetchPopularMovies: $e\n$stackTrace');
      return Left("Unexpected error: ${e.toString()}");
    }
  }

}
