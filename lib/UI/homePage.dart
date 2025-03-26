import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:moviestream/Backend/dataFetcher.dart';
import 'package:moviestream/Utils/banner.dart';
import 'package:moviestream/Utils/category.dart';
import 'package:moviestream/Utils/listTile.dart';
import 'package:moviestream/Controllers/navigation_controller.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePageController extends GetxController {
  final tmdb = Get.find<TMDB>();
  var banner = Media().obs;
  var popular = Media().obs;
  var history = Media().obs;
  var topRated = Media().obs;
  var airingToday = Media().obs;
  final ScrollController scrollController = ScrollController();
  late final DataFetcher mediaController;
  late final NavigationController navigationController;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<DataFetcher>(() => DataFetcher());
    Get.lazyPut<NavigationController>(() => NavigationController());
    mediaController = Get.find<DataFetcher>();
    navigationController = Get.find<NavigationController>();
    fetchData();
  }

  void fetchData() {
    ever(mediaController.banner, (value) {
      banner.value = value;
    });
    ever(mediaController.popular, (value) {
      popular.value = value;
    });
    ever(mediaController.topRated, (value) {
      topRated.value = value;
    });
    if (navigationController.selectedCategory.value == 'Movies') {
      mediaController.fetchMovies();
      update();
    } else if (navigationController.selectedCategory.value == 'TV Series') {
      mediaController.fetchTVSeries();
      ever(mediaController.airingToday, (value) {
        airingToday.value = value;
      });
      update();
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<NavigationController>(() => NavigationController());
    final navigationController = Get.find<NavigationController>();
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Column(
            children: [
              SizedBox(height: 60),
              CategorySelector(controller: controller),
              Expanded(
                child: Obx(() {
                  if (controller.banner.value.results.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        BannerWidget(mediaData: controller.banner),
                        ListElement(
                          mediaData: controller.popular,
                          title: "Continue Watching",
                        ),
                        ListElement(
                          mediaData: controller.popular,
                          title: navigationController.selectedCategory.value ==
                                  'TV Series'
                              ? "Top 10 Series"
                              : "Top 10 Movies",
                        ),
                        ListElement(
                          mediaData: controller.topRated,
                          title: navigationController.selectedCategory.value ==
                                  'TV Series'
                              ? "Top Rated Series"
                              : "Top Rated Movies",
                        ),
                        if (controller.airingToday.value.results.isNotEmpty &&
                            navigationController.selectedCategory.value ==
                                'TV Series')
                          ListElement(
                            mediaData: controller.airingToday,
                            title: "Airing Today",
                          ),
                      ],
                    );
                  }
                }),
              ),
            ],
          ),
          bottomNavigationBar: Obx(() {
            final navigationController = Get.find<NavigationController>();
            return BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              currentIndex: navigationController.selectedIndex.value,
              fixedColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                navigationController.updateIndex(index);
              },
            );
          }),
        );
      },
    );
  }
}
