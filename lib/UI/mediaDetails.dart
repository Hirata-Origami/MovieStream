import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/dataFetcher.dart';
import 'package:moviestream/Backend/mediaData.dart';
import 'package:moviestream/UI/test.dart';
import 'package:moviestream/Utils/dropdown.dart';
import 'package:moviestream/Utils/overview.dart';
import 'package:moviestream/Utils/player.dart';
import 'package:moviestream/Backend/genre.dart';
import 'package:moviestream/Controllers/navigation_controller.dart';
import '../Backend/movieData.dart';
import '../Backend/tvData.dart';

class MediaDetails extends StatefulWidget {
  final MediaData media;

  const MediaDetails({super.key, required this.media});

  @override
  State<MediaDetails> createState() => _MediaDetailsState();
}

class _MediaDetailsState extends State<MediaDetails> {
  late final DataFetcher mediaController;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Get.lazyPut<DataFetcher>(() => DataFetcher());
    mediaController = Get.find<DataFetcher>();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => widget.media.backdropPath.value != null
                ? Stack(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.media.backdropPath.value}',
                        height: screenHeight * 0.35,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: screenHeight * 0.35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 0.05,
                        right: screenWidth * 0.04,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[800],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(height: screenHeight * 0.35)),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => widget.media.posterPath.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${widget.media.posterPath.value}',
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.3,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.3,
                        )),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => SizedBox(
                                  width: screenWidth * 0.4,
                                  child: Text(
                                    GenreMapper.getGenresByIds(
                                            widget.media.genreIds)
                                        .join(', '),
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                )),
                            SizedBox(height: screenHeight * 0.01),
                            Obx(() => Text(
                                  ((widget.media is TvData
                                              ? (widget.media as TvData)
                                                  .firstAirDate
                                                  .value
                                              : (widget.media as MovieData)
                                                  .releaseDate
                                                  .value) ??
                                          '0000')
                                      .substring(0, 4),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.add,
                                    size: screenWidth * 0.06,
                                    color: Colors.white),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  "My List",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Column(
                              children: [
                                Icon(Icons.thumb_up,
                                    size: screenWidth * 0.06,
                                    color: Colors.white),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  "Rate",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Column(
                              children: [
                                Icon(Icons.share,
                                    size: screenWidth * 0.06,
                                    color: Colors.white),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Center(
                          child: Obx(() {
                            final vote = widget.media.voteAverage.value;
                            Color voteColor;
                            if (vote! < 4.0) {
                              voteColor = Colors.red;
                            } else if (vote < 7.0) {
                              voteColor = Colors.yellow;
                            } else {
                              voteColor = Colors.green;
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Vote Average: ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    )),
                                Text(
                                  vote.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: voteColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => VideoPlayerScreen(
                          movieId: widget.media.id.value.toString(),
                        ));
                  },
                  icon: Icon(Icons.play_arrow,
                      size: screenWidth * 0.07, color: Colors.white),
                  label: Text("Play",
                      style: TextStyle(
                          fontSize: screenWidth * 0.05, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    minimumSize: Size(double.infinity, screenHeight * 0.05),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            OverView(overview: widget.media.overview.value),
            SizedBox(height: screenHeight * 0.04),
            if (widget.media.isSeries.value == true) Dropdown(seasonCount: 10)
          ],
        ),
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
  }
}
