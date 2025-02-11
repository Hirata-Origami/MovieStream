import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedCategory = 'Movies'.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
    if (index == 0) {
      Get.toNamed('/');
    } else if (index == 1) {
      Get.toNamed('/search');
    } else if (index == 2) {
      Get.toNamed('/wishlist');
    } else if (index == 3) {
      Get.toNamed('/profile');
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    update();
  }
}
