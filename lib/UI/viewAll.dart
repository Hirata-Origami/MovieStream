import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/media.dart';
import 'package:moviestream/Utils/gridView.dart';

class ViewAllPage extends StatelessWidget {
  final Rx<Media> mediaData;
  final String title;

  const ViewAllPage({super.key, required this.mediaData, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ViewAllBody(mediaData: mediaData, screenWidth: screenWidth),
    );
  }
}
