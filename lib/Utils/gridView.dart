import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviestream/UI/mediaDetails.dart';

class ViewAllBody extends StatelessWidget {
  final Rx<Media> mediaData;
  final double screenWidth;

  const ViewAllBody({
    super.key,
    required this.mediaData,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (screenWidth / 120).floor();

    return Obx(() {
      if (mediaData.value.results.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final results = mediaData.value.results;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final media = results[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => MediaDetails(media: media));
                },
                child: GridTile(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${media.posterPath.value}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
