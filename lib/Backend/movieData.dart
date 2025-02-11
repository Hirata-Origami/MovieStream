import 'package:moviestream/Backend/mediaData.dart';
import 'package:get/get.dart';

class MovieData extends MediaData {
  var originalLanguage = Rxn<String>();
  var originalTitle = Rxn<String>();
  var releaseDate = Rxn<String>();
  var title = Rxn<String>();
  var video = Rxn<String>();

  MovieData({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? releaseDate,
    String? title,
    String? video,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
        ) {
    if (originalLanguage != null)
      this.originalLanguage.value = originalLanguage;
    if (originalTitle != null) this.originalTitle.value = originalTitle;
    if (releaseDate != null) this.releaseDate.value = releaseDate;
    if (title != null) this.title.value = title;
    if (video != null) this.video.value = video;
    isSeries.value = false;
  }

  MovieData.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    originalLanguage.value = json['original_language'];
    originalTitle.value = json['original_title'];
    releaseDate.value = json['release_date'];
    title.value = json['title'];
    video.value = "";
    isSeries.value = false;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data.addAll({
      'original_language': originalLanguage.value,
      'original_title': originalTitle.value,
      'release_date': releaseDate.value,
      'title': title.value,
      'video': video.value,
      'isSeries': isSeries.value,
    });
    return data;
  }

  @override
  MovieData copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? releaseDate,
    String? title,
    String? video,
  }) {
    return MovieData(
      adult: adult ?? this.adult.value,
      backdropPath: backdropPath ?? this.backdropPath.value,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id.value,
      popularity: popularity ?? this.popularity.value,
      posterPath: posterPath ?? this.posterPath.value,
      voteAverage: voteAverage ?? this.voteAverage.value,
      voteCount: voteCount ?? this.voteCount.value,
      originalLanguage: originalLanguage ?? this.originalLanguage.value,
      originalTitle: originalTitle ?? this.originalTitle.value,
      overview: overview ?? this.overview.value,
      releaseDate: releaseDate ?? this.releaseDate.value,
      title: title ?? this.title.value,
      video: video ?? this.video.value,
    );
  }
}
