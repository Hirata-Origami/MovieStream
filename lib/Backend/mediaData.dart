import 'package:get/get.dart';

abstract class MediaData extends GetxController {
  var adult = Rxn<bool>();
  var backdropPath = Rxn<String>();
  var genreIds = RxList<int>();
  var id = Rxn<int>();
  var isSeries = RxnBool();
  var overview = Rxn<String>();
  var popularity = Rxn<double>();
  var posterPath = Rxn<String>();
  var voteAverage = Rxn<double>();
  var voteCount = Rxn<int>();

  MediaData({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  }) {
    if (adult != null) this.adult.value = adult;
    if (backdropPath != null) this.backdropPath.value = backdropPath;
    if (genreIds != null) this.genreIds.addAll(genreIds);
    if (id != null) this.id.value = id;
    if (overview != null) this.overview.value = overview;
    if (popularity != null) this.popularity.value = popularity;
    if (posterPath != null) this.posterPath.value = posterPath;
    if (voteAverage != null) this.voteAverage.value = voteAverage;
    if (voteCount != null) this.voteCount.value = voteCount;
  }

  MediaData.fromJson(Map<String, dynamic> json) {
    adult.value = json['adult'];
    backdropPath.value = json['backdrop_path'];
    genreIds.addAll(List<int>.from(json['genre_ids'] ?? []));
    id.value = json['id'];
    overview.value = json['overview'];
    popularity.value = json['popularity'];
    posterPath.value = json['poster_path'];
    voteAverage.value = json['vote_average'];
    voteCount.value = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult.value,
      'backdrop_path': backdropPath.value,
      'genre_ids': genreIds,
      'id': id.value,
      'overview': overview.value,
      'popularity': popularity.value,
      'poster_path': posterPath.value,
      'vote_average': voteAverage.value,
      'vote_count': voteCount.value,
    };
  }

  MediaData copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  });
}
