import 'package:get/get.dart';

class Genre {
  final Rx<int> id;
  final Rx<String> name;

  Genre(this.id, this.name);
}

class GenreMapper {
  static final List<Genre> _genres = [
    Genre(28 as Rx<int>, 'Action' as Rx<String>),
    Genre(12 as Rx<int>, 'Adventure' as Rx<String>),
    Genre(16 as Rx<int>, 'Animation' as Rx<String>),
    Genre(35 as Rx<int>, 'Comedy' as Rx<String>),
    Genre(80 as Rx<int>, 'Crime' as Rx<String>),
    Genre(99 as Rx<int>, 'Documentary' as Rx<String>),
    Genre(18 as Rx<int>, 'Drama' as Rx<String>),
    Genre(10751 as Rx<int>, 'Family' as Rx<String>),
    Genre(14 as Rx<int>, 'Fantasy' as Rx<String>),
    Genre(36 as Rx<int>, 'History' as Rx<String>),
    Genre(27 as Rx<int>, 'Horror' as Rx<String>),
    Genre(10402 as Rx<int>, 'Music' as Rx<String>),
    Genre(9648 as Rx<int>, 'Mystery' as Rx<String>),
    Genre(10749 as Rx<int>, 'Romance' as Rx<String>),
    Genre(878 as Rx<int>, 'Science Fiction' as Rx<String>),
    Genre(10770 as Rx<int>, 'TV Movie' as Rx<String>),
    Genre(53 as Rx<int>, 'Thriller' as Rx<String>),
    Genre(10752 as Rx<int>, 'War' as Rx<String>),
    Genre(37 as Rx<int>, 'Western' as Rx<String>),
    Genre(10759 as Rx<int>, 'Action & Adventure' as Rx<String>),
    Genre(10762 as Rx<int>, 'Kids' as Rx<String>),
    Genre(10763 as Rx<int>, 'News' as Rx<String>),
    Genre(10764 as Rx<int>, 'Reality' as Rx<String>),
    Genre(10765 as Rx<int>, 'Sci-Fi & Fantasy' as Rx<String>),
    Genre(10766 as Rx<int>, 'Soap' as Rx<String>),
    Genre(10767 as Rx<int>, 'Talk' as Rx<String>),
    Genre(10768 as Rx<int>, 'War & Politics' as Rx<String>),
  ];

  static Rx<String> getGenreById(int id) {
    return _genres
        .firstWhere((genre) => genre.id == id,
            orElse: () => Genre(0 as Rx<int>, 'Unknown' as Rx<String>))
        .name;
  }

  static Rx<int> getIdByGenre(String name) {
    return _genres
        .firstWhere((genre) => genre.name.toLowerCase() == name.toLowerCase(),
            orElse: () => Genre(0 as Rx<int>, 'Unknown' as Rx<String>))
        .id;
  }

  static List<Rx<String>> getGenresByIds(List<int> ids) {
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

  Rx<String> getGenreById(int id) {
    return genres
        .firstWhere((genre) => genre.id == id,
            orElse: () => Genre(0 as Rx<int>, 'Unknown' as Rx<String>))
        .name;
  }

  Rx<int> getIdByGenre(String name) {
    return genres
        .firstWhere((genre) => genre.name.toLowerCase() == name.toLowerCase(),
            orElse: () => Genre(0 as Rx<int>, 'Unknown' as Rx<String>))
        .id;
  }

  List<Rx<String>> getGenresByIds(List<int> ids) {
    return ids.take(4).map((id) => getGenreById(id)).toList();
  }
}
