import "package:get/get.dart";
import "package:moviestream/Backend/movieData.dart";
import "package:moviestream/Backend/tvData.dart";

class Media extends GetxController {
  bool? isTv = false;
  var page = Rxn<int>();
  var results = <dynamic>[].obs;

  Media({int? page, List<dynamic>? results, bool isTv = false}) {
    if (page != null) {
      this.page.value = page;
    }
    if (results != null) {
      this.results.addAll(results);
    }
    if (isTv != false) {
      this.isTv = isTv;
    }
  }

  Media.fromJson(Map<String, dynamic> json) {
    page.value = json['page'];
    isTv = json['isTv'];
    if (json['results'] != null) {
      final resultsList = (json['results'] as List)
          .map((v) {
            if (isTv != null && isTv!) {
              return TvData.fromJson(v);
            } else if (isTv != null && !isTv!) {
              return MovieData.fromJson(v);
            } else if (v['media_type'] == 'tv') {
              return TvData.fromJson(v);
            } else if (v['media_type'] == 'movie') {
              return MovieData.fromJson(v);
            }
          })
          .whereType<dynamic>()
          .toList();

      results.addAll(resultsList);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page.value;
    if (results.isNotEmpty) {
      data['results'] = results.map((v) {
        if (v is MovieData) {
          return v.toJson();
        } else if (v is TvData) {
          return v.toJson();
        }
      }).toList();
    }
    return data;
  }

  Media copyWith({int? page, List<dynamic>? results}) {
    return Media(
      page: page ?? this.page.value,
      results: results ?? this.results,
    );
  }
}
