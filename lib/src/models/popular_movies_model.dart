class PopularMoviesModel {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  PopularMoviesModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }
}
