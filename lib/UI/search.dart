import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/dataFetcher.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:moviestream/Controllers/navigation_controller.dart';
import 'package:moviestream/Utils/gridView.dart';

class SearchMedia extends StatelessWidget {
  SearchMedia({super.key});

  final SearchController _searchController = Get.put(SearchController());
  final NavigationController _navigationController =
      Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigationController.selectedIndex.value = 1;
    });

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                _searchController.searchQuery.value = query;
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for movies, TV shows...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (_searchController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (_searchController.mediaData.value.results.isEmpty &&
                  _searchController.searchQuery.value.isNotEmpty) {
                return const Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                );
              } else {
                return ViewAllBody(
                  mediaData: _searchController.mediaData,
                  screenWidth: screenWidth,
                );
              }
            }),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: Obx(() {
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
          currentIndex: _navigationController.selectedIndex.value,
          fixedColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            _navigationController.updateIndex(index);
          },
        );
      }),
    );
  }
}

class SearchController extends GetxController {
  late final DataFetcher mediaController;
  Rx<Media> mediaData = Rx<Media>(Media(results: []));
  RxString searchQuery = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<DataFetcher>(() => DataFetcher());
    mediaController = Get.find<DataFetcher>();
    debounce(
      searchQuery,
      (String query) {
        searchMedia(query);
      },
      time: const Duration(milliseconds: 500),
    );
  }

  Future<void> searchMedia(String query) async {
    if (query.isEmpty) {
      mediaData.value = Media(results: []);
      isLoading.value = false;
      return;
    }
    isLoading.value = true;
    try {
      mediaController.fetchSearch(query);
      ever(mediaController.searchResults, (value) {
        mediaData.value = value;
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch search results');
    } finally {
      isLoading.value = false;
    }
  }
}
