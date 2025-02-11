import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:moviestream/Controllers/navigation_controller.dart';
import 'package:moviestream/UI/homePage.dart';

class CategorySelector extends StatefulWidget {
  final HomePageController controller;

  const CategorySelector({super.key, required this.controller});

  @override
  CategorySelectorState createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  final ValueNotifier<Color> _backgroundColor =
      ValueNotifier<Color>(Colors.black);

  @override
  void initState() {
    super.initState();
    widget.controller.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.controller.scrollController.removeListener(_scrollListener);
    _backgroundColor.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final scrollPosition = widget.controller.scrollController.position;
    final userScrollDirection = scrollPosition.userScrollDirection;
    if (userScrollDirection == ScrollDirection.reverse) {
      if (_backgroundColor.value != Colors.transparent) {
        _backgroundColor.value = Colors.transparent;
      }
    } else if (userScrollDirection == ScrollDirection.forward) {
      if (_backgroundColor.value != Colors.black) {
        _backgroundColor.value = Colors.black;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: _backgroundColor,
      builder: (context, color, child) {
        return Row(
          children: [
            Image.asset(
              'assets/logo_icon.png',
              height: 75,
              width: 100,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: color,
                child: GetBuilder<NavigationController>(
                  builder: (navigationController) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <String>['Movies', 'TV Series', 'Anime']
                            .map((String value) {
                          final bool isSelected =
                              navigationController.selectedCategory.value ==
                                  value;
                          return GestureDetector(
                            onTap: () {
                              navigationController.updateCategory(value);
                              widget.controller.fetchData();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    value,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: isSelected ? 18.0 : 14.0,
                                    ),
                                  ),
                                  if (isSelected)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4.0),
                                      height: 4.0,
                                      width: 4.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
