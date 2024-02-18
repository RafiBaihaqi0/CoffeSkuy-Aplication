import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'home_controller.dart';

class HomeController extends GetxController {
  var currentPageIndex = 0.obs; 

  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
    // Listener for page changes
    pageController.addListener(_pageListener);
  }

  @override
  void onClose() {
    // Dispose the pageController when controller is closed
    pageController.removeListener(_pageListener);
    pageController.dispose();
    super.onClose();
  }

  void _pageListener() {
    // Update currentPageIndex when page changes
    currentPageIndex.value = pageController.page!.round();
  }

  void changeTab(int index) {
    // Animate to the new page and update currentPageIndex
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}



// Place jobs_item, positionText, and titleStyle functions here
