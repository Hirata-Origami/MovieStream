import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviestream/UI/mediaDetails.dart';
import 'package:moviestream/UI/viewAll.dart';

class ListElement extends StatelessWidget {
  const ListElement({
    super.key,
    required this.title,
    required this.mediaData,
  });

  final String title;
  final Rx<Media> mediaData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (mediaData.value.results.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final results = mediaData.value.results;
        final itemCount = results.length.clamp(0, 10);

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            ViewAllPage(mediaData: mediaData, title: title));
                      },
                      child: const Text(
                        "View All  >",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: screenHeight * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    final media = results[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => MediaDetails(media: media));
                      },
                      child: Container(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.3,
                        margin: const EdgeInsets.all(8.0),
                        child: media.backdropPath?.value != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${media.posterPath.value}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
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
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
