import 'package:get/get.dart';

class EpisodeController extends GetxController {
  var episode = Episode(
    id: null,
    airDate: null,
    episodes: [],
    name: null,
    overview: null,
    episodeId: null,
    posterPath: null,
    seasonNumber: null,
    voteAverage: null,
  ).obs;

  void updateEpisode(Episode newEpisode) {
    episode.value = newEpisode;
  }
}

class Episode {
  Episode({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.episodeId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String? id;
  final DateTime? airDate;
  final List<EpisodeElement> episodes;
  final String? name;
  final String? overview;
  final int? episodeId;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  Episode copyWith({
    String? id,
    DateTime? airDate,
    List<EpisodeElement>? episodes,
    String? name,
    String? overview,
    int? episodeId,
    String? posterPath,
    int? seasonNumber,
    double? voteAverage,
  }) {
    return Episode(
      id: id ?? this.id,
      airDate: airDate ?? this.airDate,
      episodes: episodes ?? this.episodes,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      episodeId: episodeId ?? this.episodeId,
      posterPath: posterPath ?? this.posterPath,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json["_id"],
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodes: json["episodes"] == null
          ? []
          : List<EpisodeElement>.from(
              json["episodes"]!.map((x) => EpisodeElement.fromJson(x))),
      name: json["name"],
      overview: json["overview"],
      episodeId: json["id"],
      posterPath: json["poster_path"],
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "air_date":
            "${airDate?.year.toString().padLeft(4, '0')}-${airDate?.month.toString().padLeft(2, '0')}-${airDate?.day.toString().padLeft(2, '0')}",
        "episodes": episodes.map((x) => x.toJson()).toList(),
        "name": name,
        "overview": overview,
        "id": episodeId,
        "poster_path": posterPath,
        "season_number": seasonNumber,
        "vote_average": voteAverage,
      };

  @override
  String toString() {
    return "$id, $airDate, $episodes, $name, $overview, $episodeId, $posterPath, $seasonNumber, $voteAverage, ";
  }
}

class EpisodeElement {
  EpisodeElement({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
  });

  final DateTime? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final String? stillPath;
  final double? voteAverage;
  final int? voteCount;
  final List<Crew> crew;
  final List<Crew> guestStars;

  EpisodeElement copyWith({
    DateTime? airDate,
    int? episodeNumber,
    String? episodeType,
    int? id,
    String? name,
    String? overview,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    int? showId,
    String? stillPath,
    double? voteAverage,
    int? voteCount,
    List<Crew>? crew,
    List<Crew>? guestStars,
  }) {
    return EpisodeElement(
      airDate: airDate ?? this.airDate,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      episodeType: episodeType ?? this.episodeType,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      productionCode: productionCode ?? this.productionCode,
      runtime: runtime ?? this.runtime,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      showId: showId ?? this.showId,
      stillPath: stillPath ?? this.stillPath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      crew: crew ?? this.crew,
      guestStars: guestStars ?? this.guestStars,
    );
  }

  factory EpisodeElement.fromJson(Map<String, dynamic> json) {
    return EpisodeElement(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeNumber: json["episode_number"],
      episodeType: json["episode_type"],
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      productionCode: json["production_code"],
      runtime: json["runtime"],
      seasonNumber: json["season_number"],
      showId: json["show_id"],
      stillPath: json["still_path"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      crew: json["crew"] == null
          ? []
          : List<Crew>.from(json["crew"]!.map((x) => Crew.fromJson(x))),
      guestStars: json["guest_stars"] == null
          ? []
          : List<Crew>.from(json["guest_stars"]!.map((x) => Crew.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "air_date":
            "${airDate?.year.toString().padLeft(4, '0')}-${airDate?.month.toString().padLeft(2, '0')}-${airDate?.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber,
        "episode_type": episodeType,
        "id": id,
        "name": name,
        "overview": overview,
        "production_code": productionCode,
        "runtime": runtime,
        "season_number": seasonNumber,
        "show_id": showId,
        "still_path": stillPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "crew": crew.map((x) => x.toJson()).toList(),
        "guest_stars": guestStars.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$airDate, $episodeNumber, $episodeType, $id, $name, $overview, $productionCode, $runtime, $seasonNumber, $showId, $stillPath, $voteAverage, $voteCount, $crew, $guestStars, ";
  }
}

class Crew {
  Crew({
    required this.department,
    required this.job,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.order,
  });

  final String? department;
  final String? job;
  final String? creditId;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? character;
  final int? order;

  Crew copyWith({
    String? department,
    String? job,
    String? creditId,
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    String? character,
    int? order,
  }) {
    return Crew(
      department: department ?? this.department,
      job: job ?? this.job,
      creditId: creditId ?? this.creditId,
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      character: character ?? this.character,
      order: order ?? this.order,
    );
  }

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      department: json["department"],
      job: json["job"],
      creditId: json["credit_id"],
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"],
      profilePath: json["profile_path"],
      character: json["character"],
      order: json["order"],
    );
  }

  Map<String, dynamic> toJson() => {
        "department": department,
        "job": job,
        "credit_id": creditId,
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "character": character,
        "order": order,
      };

  @override
  String toString() {
    return "$department, $job, $creditId, $adult, $gender, $id, $knownForDepartment, $name, $originalName, $popularity, $profilePath, $character, $order, ";
  }
}
