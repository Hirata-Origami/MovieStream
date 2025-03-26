import 'dart:async';
import 'package:moviestream/Backend/genre.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:moviestream/Backend/tvData.dart';
import 'package:moviestream/UI/mediaDetails.dart';
import 'package:moviestream/Utils/player.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.mediaData,
  });

  final Rx<Media> mediaData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GetX<Media>(
      init: mediaData.value,
      builder: (controller) {
        if (controller.results.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: BannerContent(
              mediaData: mediaData,
              theme: theme,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            ),
          );
        }
      },
    );
  }
}

class BannerContent extends StatefulWidget {
  const BannerContent({
    super.key,
    required this.mediaData,
    required this.theme,
    required this.screenHeight,
    required this.screenWidth,
  });

  final Rx<Media> mediaData;
  final ThemeData theme;
  final double screenHeight;
  final double screenWidth;

  @override
  State<BannerContent> createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0, initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.page!.round() <
          widget.mediaData.value.results.length - 1) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight * 0.6,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.mediaData.value.results.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              var media = widget.mediaData.value.results[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${media.backdropPath.value}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: widget.screenHeight * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: widget.screenHeight * 0.015,
                    left: widget.screenWidth * 0.05,
                    right: widget.screenWidth * 0.05,
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      padding: EdgeInsets.all(widget.screenWidth * 0.025),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              (media is TvData
                                      ? media.name.value
                                      : media.title.value) ??
                                  'No Title',
                              style: widget.theme.textTheme.headlineLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widget.screenWidth * 0.08),
                            ),
                          ),
                          SizedBox(height: widget.screenHeight * 0.02),
                          Center(
                            child: Wrap(
                              spacing: widget.screenWidth * 0.02,
                              runSpacing: widget.screenHeight * 0.01,
                              children: media.genreIds.map<Widget>((genreId) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${GenreMapper.getGenreById(genreId)}  ",
                                      style: widget.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize:
                                                  widget.screenWidth * 0.035),
                                    ),
                                    if (genreId != media.genreIds.last)
                                      Icon(
                                        Icons.add,
                                        color: Colors.red,
                                        size: widget.screenWidth * 0.035,
                                      ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: widget.screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.add,
                                      size: widget.screenWidth * 0.08,
                                      color: Colors.white),
                                  SizedBox(height: widget.screenHeight * 0.005),
                                  Text(
                                    "My List",
                                    style: widget.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontSize:
                                                widget.screenWidth * 0.025),
                                  ),
                                ],
                              ),
                              ElevatedButton.icon(
                                onPressed: () => Get.to(() => VideoPlayerScreen(
                                      isTv: media.isSeries.value!,
                                      movieId: media.id.value.toString(),
                                      seriesId: media.id.value.toString(),
                                      seasonNumber: 1,
                                      episodeNumber: 1,
                                    )),
                                icon: Icon(Icons.play_arrow,
                                    color: Colors.black,
                                    size: widget.screenWidth * 0.08),
                                label: Text(
                                  "Play",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widget.screenWidth * 0.04),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: widget.screenWidth * 0.05,
                                      vertical: widget.screenHeight * 0.01),
                                ),
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.to(
                                        () => MediaDetails(media: media)),
                                    child: Icon(Icons.info,
                                        size: widget.screenWidth * 0.08,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: widget.screenHeight * 0.005),
                                  Text(
                                    "Info",
                                    style: widget.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontSize:
                                                widget.screenWidth * 0.025),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              //put app icon here
            ),
          ),
        ],
      ),
    );
  }
}
