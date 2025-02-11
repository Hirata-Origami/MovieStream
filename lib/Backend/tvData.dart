import 'package:moviestream/Backend/mediaData.dart';
import 'package:get/get.dart';

class TvData extends MediaData {
  var originCountry = RxList<String>();
  var originalLanguage = Rxn<String>();
  var originalName = Rxn<String>();
  var firstAirDate = Rxn<String>();
  var name = Rxn<String>();

  TvData({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    String? firstAirDate,
    String? name,
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
    if (originCountry != null) this.originCountry.addAll(originCountry);
    if (originalLanguage != null)
      this.originalLanguage.value = originalLanguage;
    if (originalName != null) this.originalName.value = originalName;
    if (firstAirDate != null) this.firstAirDate.value = firstAirDate;
    if (name != null) this.name.value = name;
    isSeries.value = true;
  }

  TvData.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    originCountry.addAll(List<String>.from(json['origin_country'] ?? []));
    originalLanguage.value = json['original_language'];
    originalName.value = json['original_name'];
    firstAirDate.value = json['first_air_date'];
    name.value = json['name'];
    isSeries.value = true;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data.addAll({
      'origin_country': originCountry,
      'original_language': originalLanguage.value,
      'original_name': originalName.value,
      'first_air_date': firstAirDate.value,
      'name': name.value,
      'isSeries': isSeries.value,
    });
    return data;
  }

  @override
  TvData copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    String? firstAirDate,
    String? name,
  }) {
    return TvData(
      adult: adult ?? this.adult.value,
      backdropPath: backdropPath ?? this.backdropPath.value,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id.value,
      popularity: popularity ?? this.popularity.value,
      posterPath: posterPath ?? this.posterPath.value,
      voteAverage: voteAverage ?? this.voteAverage.value,
      voteCount: voteCount ?? this.voteCount.value,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage.value,
      originalName: originalName ?? this.originalName.value,
      overview: overview ?? this.overview.value,
      firstAirDate: firstAirDate ?? this.firstAirDate.value,
      name: name ?? this.name.value,
    );
  }
}
