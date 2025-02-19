import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class DataFetcher extends GetxController {
  static final DataFetcher _instance = DataFetcher._internal();

  factory DataFetcher() {
    return _instance;
  }

  DataFetcher._internal();

  final tmdb = Get.find<TMDB>();
  var banner = Media().obs;
  var popular = Media().obs;
  var topRated = Media().obs;
  var airingToday = Media().obs;

  void fetchMovies() async {
    try {
      Map<String, dynamic> response =
          (await tmdb.v3.movies.getNowPlaying()) as Map<String, dynamic>;
      response['isTv'] = false;
      banner.value = Media.fromJson(response);
      response = (await tmdb.v3.movies.getPopular()) as Map<String, dynamic>;
      response['isTv'] = false;
      popular.value = Media.fromJson(response);
      response = (await tmdb.v3.movies.getTopRated()) as Map<String, dynamic>;
      response['isTv'] = false;
      topRated.value = Media.fromJson(response);
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }

  void fetchTVSeries() async {
    try {
      Map<String, dynamic> response =
          (await tmdb.v3.tv.getPopular(page: 2)) as Map<String, dynamic>;
      response['isTv'] = true;
      banner.value = Media.fromJson(response);
      response = (await tmdb.v3.tv.getPopular()) as Map<String, dynamic>;
      response['isTv'] = true;
      popular.value = Media.fromJson(response);
      response = (await tmdb.v3.tv.getTopRated()) as Map<String, dynamic>;
      response['isTv'] = true;
      topRated.value = Media.fromJson(response);
      response = (await tmdb.v3.tv.getAiringToday()) as Map<String, dynamic>;
      response['isTv'] = true;
      airingToday.value = Media.fromJson(response);
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }

  Future<Map<String, dynamic>> fetchSeasonDetails(int tvId) async {
    Map<String, dynamic> response = {};
    try {
      response = (await tmdb.v3.tv.getDetails(tvId)) as Map<String, dynamic>;
      return response;
    } catch (e) {
      print("Error fetching season details: $e");
    }
    return response;
  }

  void fetchAnime() async {
    try {
      Map<String, dynamic> response =
          (await tmdb.v3.movies.getPopular(page: 2)) as Map<String, dynamic>;
      banner.value = Media.fromJson(response);
      response = (await tmdb.v3.movies.getPopular()) as Map<String, dynamic>;
      popular.value = Media.fromJson(response);
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }
}
