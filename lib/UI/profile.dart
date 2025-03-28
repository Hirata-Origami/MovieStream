import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:moviestream/UI/mediaDetails.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white70),
            onPressed: () {
              Get.snackbar('Edit Profile', 'Edit functionality coming soon!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: _profileController.userAvatar.value,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _profileController.userName.value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _profileController.userEmail.value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Logout', 'Logout functionality coming soon!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Favorites',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(() {
                    if (_profileController.favorites.value.results.isEmpty) {
                      return const Center(
                        child: Text(
                          'No favorites yet!',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      );
                    } else {
                      return ProfileFavoritesGrid(
                        mediaData: _profileController.favorites,
                        screenWidth: screenWidth,
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class ProfileController extends GetxController {
  RxString userName = 'John Doe'.obs;
  RxString userEmail = 'john.doe@example.com'.obs;
  RxString userAvatar = 'https://via.placeholder.com/150'.obs;
  Rx<Media> favorites = Rx<Media>(Media(results: []));

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
    fetchFavorites();
  }

  void fetchUserProfile() {
    userName.value = 'John Doe';
    userEmail.value = 'john.doe@example.com';
    userAvatar.value = 'https://via.placeholder.com/150';
  }

  void fetchFavorites() {
    favorites.value = Media(results: []);
  }
}

class ProfileFavoritesGrid extends StatelessWidget {
  final Rx<Media> mediaData;
  final double screenWidth;

  const ProfileFavoritesGrid({
    super.key,
    required this.mediaData,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (screenWidth / 120).floor();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: mediaData.value.results.length,
      itemBuilder: (context, index) {
        final media = mediaData.value.results[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => MediaDetails(media: media));
          },
          child: GridTile(
            child: media.backdropPath?.value != null
                ? CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${media.posterPath.value}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.asset(
                    'assets/no_Image.jpg',
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
    );
  }
}
