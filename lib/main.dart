import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:moviestream/UI/profile.dart';
import 'package:moviestream/UI/search.dart';
import 'package:moviestream/UI/theme.dart';
import 'package:moviestream/UI/wishlist.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:moviestream/UI/homePage.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final tmdb = Get.put(TMDB(
    ApiKeys(
        dotenv.env['API_KEY'] ?? '', dotenv.env['API_READ_ACCESS_TOKEN'] ?? ''),
    logConfig: const ConfigLogger.showAll(),
  ));

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/search', page: () => SearchMedia()),
        GetPage(name: '/wishlist', page: () => Wishlist()),
        GetPage(name: '/profile', page: () => Profile()),
      ],
    );
  }
}
