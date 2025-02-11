import 'package:get/get.dart';

class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);
}

class GenreMapper {
  static final List<Genre> _genres = [
    Genre(28, 'Action'),
    Genre(12, 'Adventure'),
    Genre(16, 'Animation'),
    Genre(35, 'Comedy'),
    Genre(80, 'Crime'),
    Genre(99, 'Documentary'),
    Genre(18, 'Drama'),
    Genre(10751, 'Family'),
    Genre(14, 'Fantasy'),
    Genre(36, 'History'),
    Genre(27, 'Horror'),
    Genre(10402, 'Music'),
    Genre(9648, 'Mystery'),
    Genre(10749, 'Romance'),
    Genre(878, 'Science Fiction'),
    Genre(10770, 'TV Movie'),
    Genre(53, 'Thriller'),
    Genre(10752, 'War'),
    Genre(37, 'Western'),
    Genre(10759, 'Action & Adventure'),
    Genre(10762, 'Kids'),
    Genre(10763, 'News'),
    Genre(10764, 'Reality'),
    Genre(10765, 'Sci-Fi & Fantasy'),
    Genre(10766, 'Soap'),
    Genre(10767, 'Talk'),
    Genre(10768, 'War & Politics'),
  ];

  static String getGenreById(int id) {
    return _genres
        .firstWhere((genre) => genre.id == id,
            orElse: () => Genre(0, 'Unknown'))
        .name;
  }

  static int getIdByGenre(String name) {
    return _genres
        .firstWhere((genre) => genre.name.toLowerCase() == name.toLowerCase(),
            orElse: () => Genre(0, 'Unknown'))
        .id;
  }

  static List<String> getGenresByIds(List<int> ids) {
    return ids.take(4).map((id) => getGenreById(id)).toList();
  }
}

class GenreController extends GetxController {
  var genres = <Genre>[].obs;

  @override
  void onInit() {
    super.onInit();
    genres.addAll(GenreMapper._genres);
  }

  String getGenreById(int id) {
    return genres
        .firstWhere((genre) => genre.id == id,
            orElse: () => Genre(0, 'Unknown'))
        .name;
  }

  int getIdByGenre(String name) {
    return genres
        .firstWhere((genre) => genre.name.toLowerCase() == name.toLowerCase(),
            orElse: () => Genre(0, 'Unknown'))
        .id;
  }

  List<String> getGenresByIds(List<int> ids) {
    return ids.take(4).map((id) => getGenreById(id)).toList();
  }
}
