import 'package:cinemax/services/api/base_class_services.dart';
import 'package:cinemax/src/models/upcoming_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesServices {
  final ApiBaseClientService _apiBaseClientService;

  UpcomingMoviesServices(this._apiBaseClientService);

 Future<Either<String, List<Movie>>> fetchUpcomingMovies() async {
  try {
    final response = await _apiBaseClientService.request(
      endpoint: "upcoming?language=en-US&page=1",
      method: 'GET',
    );

    debugPrint('Fetch success: ${response.data}');

    if (response.data != null) {
      // Parse the main response into the MovieApiResponse model
      final apiResponse = UpcomingMoviesModel.fromJson(response.data);

      // Extract the list of movies from the response
      final upcomingMovies = apiResponse.results;

      debugPrint('Fetched movie data: $upcomingMovies');

      return Right(upcomingMovies);
    } else {
      final errorMessage = response.data?['message'] ?? "Something went wrong!";
      return Left(errorMessage);
    }
  } catch (e, stackTrace) {
    debugPrint('Error in fetchUpcomingMovies: $e\n$stackTrace');
    return Left("Unexpected error: ${e.toString()}");
  }
}

}
