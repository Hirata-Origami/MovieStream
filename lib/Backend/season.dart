import 'package:get/get.dart';
import 'package:moviestream/Backend/genre.dart';

class Season extends GetxController {
  Season({
    required RxBool adult,
    required Rx<String?> backdropPath,
    required RxList<CreatedBy> createdBy,
    required RxList<int> episodeRunTime,
    required Rx<DateTime?> firstAirDate,
    required RxList<Genre> genres,
    required Rx<String?> homepage,
    required RxInt id,
    required RxBool inProduction,
    required RxList<String> languages,
    required Rx<DateTime?> lastAirDate,
    required Rx<LastEpisodeToAir?> lastEpisodeToAir,
    required RxString name,
    required Rx<NextEpisodeToAir?> nextEpisodeToAir,
    required RxList<Network> networks,
    required RxInt numberOfEpisodes,
    required RxInt numberOfSeasons,
    required RxList<String> originCountry,
    required RxString originalLanguage,
    required RxString originalName,
    required RxString overview,
    required RxDouble popularity,
    required Rx<String?> posterPath,
    required RxList<Network> productionCompanies,
    required RxList<ProductionCountry> productionCountries,
    required RxList<SeasonElement> seasons,
    required RxList<SpokenLanguage> spokenLanguages,
    required RxString status,
    required Rx<String?> tagline,
    required RxString type,
    required RxDouble voteAverage,
    required RxInt voteCount,
  })  : adult = adult,
        backdropPath = backdropPath,
        createdBy = createdBy,
        episodeRunTime = episodeRunTime,
        firstAirDate = firstAirDate,
        genres = genres,
        homepage = homepage,
        id = id,
        inProduction = inProduction,
        languages = languages,
        lastAirDate = lastAirDate,
        lastEpisodeToAir = lastEpisodeToAir,
        name = name,
        nextEpisodeToAir = nextEpisodeToAir,
        networks = networks,
        numberOfEpisodes = numberOfEpisodes,
        numberOfSeasons = numberOfSeasons,
        originCountry = originCountry,
        originalLanguage = originalLanguage,
        originalName = originalName,
        overview = overview,
        popularity = popularity,
        posterPath = posterPath,
        productionCompanies = productionCompanies,
        productionCountries = productionCountries,
        seasons = seasons,
        spokenLanguages = spokenLanguages,
        status = status,
        tagline = tagline,
        type = type,
        voteAverage = voteAverage,
        voteCount = voteCount;

  final RxBool adult;
  final Rx<String?> backdropPath;
  final RxList<CreatedBy> createdBy;
  final RxList<int> episodeRunTime;
  final Rx<DateTime?> firstAirDate;
  final RxList<Genre> genres;
  final Rx<String?> homepage;
  final RxInt id;
  final RxBool inProduction;
  final RxList<String> languages;
  final Rx<DateTime?> lastAirDate;
  final Rx<LastEpisodeToAir?> lastEpisodeToAir;
  final RxString name;
  final Rx<NextEpisodeToAir?> nextEpisodeToAir;
  final RxList<Network> networks;
  final RxInt numberOfEpisodes;
  final RxInt numberOfSeasons;
  final RxList<String> originCountry;
  final RxString originalLanguage;
  final RxString originalName;
  final RxString overview;
  final RxDouble popularity;
  final Rx<String?> posterPath;
  final RxList<Network> productionCompanies;
  final RxList<ProductionCountry> productionCountries;
  final RxList<SeasonElement> seasons;
  final RxList<SpokenLanguage> spokenLanguages;
  final RxString status;
  final Rx<String?> tagline;
  final RxString type;
  final RxDouble voteAverage;
  final RxInt voteCount;

  Season copyWith({
    RxBool? adult,
    Rx<String?>? backdropPath,
    RxList<CreatedBy>? createdBy,
    RxList<int>? episodeRunTime,
    Rx<DateTime?>? firstAirDate,
    RxList<Genre>? genres,
    Rx<String?>? homepage,
    RxInt? id,
    RxBool? inProduction,
    RxList<String>? languages,
    Rx<DateTime?>? lastAirDate,
    Rx<LastEpisodeToAir?>? lastEpisodeToAir,
    RxString? name,
    Rx<NextEpisodeToAir?>? nextEpisodeToAir,
    RxList<Network>? networks,
    RxInt? numberOfEpisodes,
    RxInt? numberOfSeasons,
    RxList<String>? originCountry,
    RxString? originalLanguage,
    RxString? originalName,
    RxString? overview,
    RxDouble? popularity,
    Rx<String?>? posterPath,
    RxList<Network>? productionCompanies,
    RxList<ProductionCountry>? productionCountries,
    RxList<SeasonElement>? seasons,
    RxList<SpokenLanguage>? spokenLanguages,
    RxString? status,
    Rx<String?>? tagline,
    RxString? type,
    RxDouble? voteAverage,
    RxInt? voteCount,
  }) {
    return Season(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      createdBy: createdBy ?? this.createdBy,
      episodeRunTime: episodeRunTime ?? this.episodeRunTime,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      inProduction: inProduction ?? this.inProduction,
      languages: languages ?? this.languages,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
      name: name ?? this.name,
      nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
      networks: networks ?? this.networks,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      productionCountries: productionCountries ?? this.productionCountries,
      seasons: seasons ?? this.seasons,
      spokenLanguages: spokenLanguages ?? this.spokenLanguages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      type: type ?? this.type,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      adult: (json["adult"] ?? false).obs,
      backdropPath: (json["backdrop_path"] as String?).obs,
      createdBy: RxList<CreatedBy>.from(json["created_by"] == null
          ? []
          : json["created_by"]!.map((x) => CreatedBy.fromJson(x))),
      episodeRunTime: RxList<int>.from(json["episode_run_time"] == null
          ? []
          : json["episode_run_time"]!.map((x) => x as int)),
      firstAirDate: (json["first_air_date"] == null
              ? null
              : DateTime.tryParse(json["first_air_date"]))
          .obs,
      genres: RxList<Genre>.from(json["genres"] == null
          ? []
          : json["genres"]!.map((x) => Genre(x["id"], x["name"]))),
      homepage: (json["homepage"] as String?).obs,
      id: (json["id"] ?? 0).obs,
      inProduction: (json["in_production"] ?? false).obs,
      languages: RxList<String>.from(json["languages"] == null
          ? []
          : json["languages"]!.map((x) => x as String)),
      lastAirDate: (json["last_air_date"] == null
              ? null
              : DateTime.tryParse(json["last_air_date"]))
          .obs,
      lastEpisodeToAir: (json["last_episode_to_air"] == null
              ? null
              : LastEpisodeToAir.fromJson(json["last_episode_to_air"]))
          .obs,
      name: (json["name"] ?? "").obs,
      nextEpisodeToAir: (json["next_episode_to_air"] == null
              ? null
              : NextEpisodeToAir.fromJson(json["next_episode_to_air"]))
          .obs,
      networks: RxList<Network>.from(json["networks"] == null
          ? []
          : json["networks"]!.map((x) => Network.fromJson(x))),
      numberOfEpisodes: (json["number_of_episodes"] ?? 0).obs,
      numberOfSeasons: (json["number_of_seasons"] ?? 0).obs,
      originCountry: RxList<String>.from(json["origin_country"] == null
          ? []
          : json["origin_country"]!.map((x) => x as String)),
      originalLanguage: (json["original_language"] ?? "").obs,
      originalName: (json["original_name"] ?? "").obs,
      overview: (json["overview"] ?? "").obs,
      popularity: ((json["popularity"] as num?)?.toDouble() ?? 0.0).obs,
      posterPath: (json["poster_path"] as String?).obs,
      productionCompanies: RxList<Network>.from(
          json["production_companies"] == null
              ? []
              : json["production_companies"]!.map((x) => Network.fromJson(x))),
      productionCountries: RxList<ProductionCountry>.from(
          json["production_countries"] == null
              ? []
              : json["production_countries"]!
                  .map((x) => ProductionCountry.fromJson(x))),
      seasons: RxList<SeasonElement>.from(json["seasons"] == null
          ? []
          : json["seasons"]!.map((x) => SeasonElement.fromJson(x))),
      spokenLanguages: RxList<SpokenLanguage>.from(json["spoken_languages"] ==
              null
          ? []
          : json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: (json["status"] ?? "").obs,
      tagline: (json["tagline"] as String?).obs,
      type: (json["type"] ?? "").obs,
      voteAverage: ((json["vote_average"] as num?)?.toDouble() ?? 0.0).obs,
      voteCount: (json["vote_count"] ?? 0).obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "adult": adult.value,
        "backdrop_path": backdropPath.value,
        "created_by": createdBy.map((x) => x.toJson()).toList(),
        "episode_run_time": episodeRunTime,
        "first_air_date": firstAirDate.value?.toIso8601String(),
        "genres": genres.map((x) => {"id": x.id, "name": x.name}).toList(),
        "homepage": homepage.value,
        "id": id.value,
        "in_production": inProduction.value,
        "languages": languages,
        "last_air_date": lastAirDate.value?.toIso8601String(),
        "last_episode_to_air": lastEpisodeToAir.value?.toJson(),
        "name": name.value,
        "next_episode_to_air": nextEpisodeToAir.value?.toJson(),
        "networks": networks.map((x) => x.toJson()).toList(),
        "number_of_episodes": numberOfEpisodes.value,
        "number_of_seasons": numberOfSeasons.value,
        "origin_country": originCountry,
        "original_language": originalLanguage.value,
        "original_name": originalName.value,
        "overview": overview.value,
        "popularity": popularity.value,
        "poster_path": posterPath.value,
        "production_companies":
            productionCompanies.map((x) => x.toJson()).toList(),
        "production_countries":
            productionCountries.map((x) => x.toJson()).toList(),
        "seasons": seasons.map((x) => x.toJson()).toList(),
        "spoken_languages": spokenLanguages.map((x) => x.toJson()).toList(),
        "status": status.value,
        "tagline": tagline.value,
        "type": type.value,
        "vote_average": voteAverage.value,
        "vote_count": voteCount.value,
      };

  @override
  String toString() {
    return "$adult, $backdropPath, $createdBy, $episodeRunTime, $firstAirDate, $genres, $homepage, $id, $inProduction, $languages, $lastAirDate, $lastEpisodeToAir, $name, $nextEpisodeToAir, $networks, $numberOfEpisodes, $numberOfSeasons, $originCountry, $originalLanguage, $originalName, $overview, $popularity, $posterPath, $productionCompanies, $productionCountries, $seasons, $spokenLanguages, $status, $tagline, $type, $voteAverage, $voteCount";
  }
}

class CreatedBy extends GetxController {
  CreatedBy({
    required RxInt id,
    required RxString creditId,
    required RxString name,
    required RxInt gender,
    required Rx<String?> profilePath,
  })  : id = id,
        creditId = creditId,
        name = name,
        gender = gender,
        profilePath = profilePath;

  final RxInt id;
  final RxString creditId;
  final RxString name;
  final RxInt gender;
  final Rx<String?> profilePath;

  CreatedBy copyWith({
    RxInt? id,
    RxString? creditId,
    RxString? name,
    RxInt? gender,
    Rx<String?>? profilePath,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: (json["id"] ?? 0).obs,
      creditId: (json["credit_id"] ?? "").obs,
      name: (json["name"] ?? "").obs,
      gender: (json["gender"] ?? 0).obs,
      profilePath: (json["profile_path"] as String?).obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id.value,
        "credit_id": creditId.value,
        "name": name.value,
        "gender": gender.value,
        "profile_path": profilePath.value,
      };
}

class LastEpisodeToAir extends GetxController {
  LastEpisodeToAir({
    required RxInt id,
    required RxString name,
    required Rx<DateTime?> airDate,
    required RxInt episodeNumber,
    required RxString overview,
    required RxString productionCode,
    required Rx<int?> runtime,
    required RxInt seasonNumber,
    required RxInt showId,
    required Rx<String?> stillPath,
    required RxDouble voteAverage,
    required RxInt voteCount,
  })  : id = id,
        name = name,
        airDate = airDate,
        episodeNumber = episodeNumber,
        overview = overview,
        productionCode = productionCode,
        runtime = runtime,
        seasonNumber = seasonNumber,
        showId = showId,
        stillPath = stillPath,
        voteAverage = voteAverage,
        voteCount = voteCount;

  final RxInt id;
  final RxString name;
  final Rx<DateTime?> airDate;
  final RxInt episodeNumber;
  final RxString overview;
  final RxString productionCode;
  final Rx<int?> runtime;
  final RxInt seasonNumber;
  final RxInt showId;
  final Rx<String?> stillPath;
  final RxDouble voteAverage;
  final RxInt voteCount;

  LastEpisodeToAir copyWith({
    RxInt? id,
    RxString? name,
    Rx<DateTime?>? airDate,
    RxInt? episodeNumber,
    RxString? overview,
    RxString? productionCode,
    Rx<int?>? runtime,
    RxInt? seasonNumber,
    RxInt? showId,
    Rx<String?>? stillPath,
    RxDouble? voteAverage,
    RxInt? voteCount,
  }) {
    return LastEpisodeToAir(
      id: id ?? this.id,
      name: name ?? this.name,
      airDate: airDate ?? this.airDate,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      overview: overview ?? this.overview,
      productionCode: productionCode ?? this.productionCode,
      runtime: runtime ?? this.runtime,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      showId: showId ?? this.showId,
      stillPath: stillPath ?? this.stillPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return LastEpisodeToAir(
      id: (json["id"] ?? 0).obs,
      name: (json["name"] ?? "").obs,
      airDate: (json["air_date"] == null
              ? null
              : DateTime.tryParse(json["air_date"]))
          .obs,
      episodeNumber: (json["episode_number"] ?? 0).obs,
      overview: (json["overview"] ?? "").obs,
      productionCode: (json["production_code"] ?? "").obs,
      runtime: (json["runtime"] as int?).obs,
      seasonNumber: (json["season_number"] ?? 0).obs,
      showId: (json["show_id"] ?? 0).obs,
      stillPath: (json["still_path"] as String?).obs,
      voteAverage: ((json["vote_average"] as num?)?.toDouble() ?? 0.0).obs,
      voteCount: (json["vote_count"] ?? 0).obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id.value,
        "name": name.value,
        "air_date": airDate.value?.toIso8601String(),
        "episode_number": episodeNumber.value,
        "overview": overview.value,
        "production_code": productionCode.value,
        "runtime": runtime.value,
        "season_number": seasonNumber.value,
        "show_id": showId.value,
        "still_path": stillPath.value,
        "vote_average": voteAverage.value,
        "vote_count": voteCount.value,
      };
}

class NextEpisodeToAir extends GetxController {
  NextEpisodeToAir({
    required RxInt id,
    required RxString name,
    required Rx<DateTime?> airDate,
    required RxInt episodeNumber,
    required RxString overview,
    required RxString productionCode,
    required Rx<int?> runtime,
    required RxInt seasonNumber,
    required RxInt showId,
    required Rx<String?> stillPath,
    required RxDouble voteAverage,
    required RxInt voteCount,
  })  : id = id,
        name = name,
        airDate = airDate,
        episodeNumber = episodeNumber,
        overview = overview,
        productionCode = productionCode,
        runtime = runtime,
        seasonNumber = seasonNumber,
        showId = showId,
        stillPath = stillPath,
        voteAverage = voteAverage,
        voteCount = voteCount;

  final RxInt id;
  final RxString name;
  final Rx<DateTime?> airDate;
  final RxInt episodeNumber;
  final RxString overview;
  final RxString productionCode;
  final Rx<int?> runtime;
  final RxInt seasonNumber;
  final RxInt showId;
  final Rx<String?> stillPath;
  final RxDouble voteAverage;
  final RxInt voteCount;

  NextEpisodeToAir copyWith({
    RxInt? id,
    RxString? name,
    Rx<DateTime?>? airDate,
    RxInt? episodeNumber,
    RxString? overview,
    RxString? productionCode,
    Rx<int?>? runtime,
    RxInt? seasonNumber,
    RxInt? showId,
    Rx<String?>? stillPath,
    RxDouble? voteAverage,
    RxInt? voteCount,
  }) {
    return NextEpisodeToAir(
      id: id ?? this.id,
      name: name ?? this.name,
      airDate: airDate ?? this.airDate,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      overview: overview ?? this.overview,
      productionCode: productionCode ?? this.productionCode,
      runtime: runtime ?? this.runtime,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      showId: showId ?? this.showId,
      stillPath: stillPath ?? this.stillPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return NextEpisodeToAir(
      id: (json["id"] ?? 0).obs,
      name: (json["name"] ?? "").obs,
      airDate: (json["air_date"] == null
              ? null
              : DateTime.tryParse(json["air_date"]))
          .obs,
      episodeNumber: (json["episode_number"] ?? 0).obs,
      overview: (json["overview"] ?? "").obs,
      productionCode: (json["production_code"] ?? "").obs,
      runtime: (json["runtime"] as int?).obs,
      seasonNumber: (json["season_number"] ?? 0).obs,
      showId: (json["show_id"] ?? 0).obs,
      stillPath: (json["still_path"] as String?).obs,
      voteAverage: ((json["vote_average"] as num?)?.toDouble() ?? 0.0).obs,
      voteCount: (json["vote_count"] ?? 0).obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id.value,
        "name": name.value,
        "air_date": airDate.value?.toIso8601String(),
        "episode_number": episodeNumber.value,
        "overview": overview.value,
        "production_code": productionCode.value,
        "runtime": runtime.value,
        "season_number": seasonNumber.value,
        "show_id": showId.value,
        "still_path": stillPath.value,
        "vote_average": voteAverage.value,
        "vote_count": voteCount.value,
      };
}

class Network extends GetxController {
  Network({
    required RxInt id,
    required RxString name,
    required Rx<String?> logoPath,
    required RxString originCountry,
  })  : id = id,
        name = name,
        logoPath = logoPath,
        originCountry = originCountry;

  final RxInt id;
  final RxString name;
  final Rx<String?> logoPath;
  final RxString originCountry;

  Network copyWith({
    RxInt? id,
    RxString? name,
    Rx<String?>? logoPath,
    RxString? originCountry,
  }) {
    return Network(
      id: id ?? this.id,
      name: name ?? this.name,
      logoPath: logoPath ?? this.logoPath,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: (json["id"] ?? 0).obs,
      name: (json["name"] ?? "").obs,
      logoPath: (json["logo_path"] as String?).obs,
      originCountry: (json["origin_country"] ?? "").obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id.value,
        "name": name.value,
        "logo_path": logoPath.value,
        "origin_country": originCountry.value,
      };
}

class ProductionCountry extends GetxController {
  ProductionCountry({
    required RxString iso31661,
    required RxString name,
  })  : iso31661 = iso31661,
        name = name;

  final RxString iso31661;
  final RxString name;

  ProductionCountry copyWith({
    RxString? iso31661,
    RxString? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: (json["iso_3166_1"] ?? "").obs,
      name: (json["name"] ?? "").obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661.value,
        "name": name.value,
      };
}

class SeasonElement extends GetxController {
  SeasonElement({
    required Rx<DateTime?> airDate,
    required RxInt episodeCount,
    required RxInt id,
    required RxString name,
    required RxString overview,
    required Rx<String?> posterPath,
    required RxInt seasonNumber,
  })  : airDate = airDate,
        episodeCount = episodeCount,
        id = id,
        name = name,
        overview = overview,
        posterPath = posterPath,
        seasonNumber = seasonNumber;

  final Rx<DateTime?> airDate;
  final RxInt episodeCount;
  final RxInt id;
  final RxString name;
  final RxString overview;
  final Rx<String?> posterPath;
  final RxInt seasonNumber;

  SeasonElement copyWith({
    Rx<DateTime?>? airDate,
    RxInt? episodeCount,
    RxInt? id,
    RxString? name,
    RxString? overview,
    Rx<String?>? posterPath,
    RxInt? seasonNumber,
  }) {
    return SeasonElement(
      airDate: airDate ?? this.airDate,
      episodeCount: episodeCount ?? this.episodeCount,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      seasonNumber: seasonNumber ?? this.seasonNumber,
    );
  }

  factory SeasonElement.fromJson(Map<String, dynamic> json) {
    return SeasonElement(
      airDate: (json["air_date"] == null
              ? null
              : DateTime.tryParse(json["air_date"]))
          .obs,
      episodeCount: (json["episode_count"] ?? 0).obs,
      id: (json["id"] ?? 0).obs,
      name: (json["name"] ?? "").obs,
      overview: (json["overview"] ?? "").obs,
      posterPath: (json["poster_path"] as String?).obs,
      seasonNumber: (json["season_number"] ?? 0).obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "air_date": airDate.value?.toIso8601String(),
        "episode_count": episodeCount.value,
        "id": id.value,
        "name": name.value,
        "overview": overview.value,
        "poster_path": posterPath.value,
        "season_number": seasonNumber.value,
      };
}

class SpokenLanguage extends GetxController {
  SpokenLanguage({
    required RxString iso6391,
    required RxString name,
  })  : iso6391 = iso6391,
        name = name;

  final RxString iso6391;
  final RxString name;

  SpokenLanguage copyWith({
    RxString? iso6391,
    RxString? name,
  }) {
    return SpokenLanguage(
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
    );
  }

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      iso6391: (json["iso_639_1"] ?? "").obs,
      name: (json["name"] ?? "").obs,
    );
  }

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391.value,
        "name": name.value,
      };
}
