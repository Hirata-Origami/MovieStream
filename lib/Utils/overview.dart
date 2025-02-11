import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextToggleController extends GetxController {
  var isExpanded = false.obs;
}

class OverView extends StatelessWidget {
  final String? overview;

  OverView({this.overview});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(TextToggleController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              return Text(
                overview ?? '',
                style: TextStyle(fontSize: 16),
                maxLines: controller.isExpanded.value ? null : 3,
                overflow: controller.isExpanded.value
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              );
            },
          ),
          GestureDetector(onTap: () {
            controller.isExpanded.value = !controller.isExpanded.value;
          }, child: Obx(() {
            return Text(
              controller.isExpanded.value ? 'Show Less' : 'Show More',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            );
          })),
        ],
      ),
    );
  }
}
