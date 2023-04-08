import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  late PageController pageController;

  RxInt currentpage = 0.obs;
  void goToTab(int page) {
    currentpage.value = page;
    pageController.jumpToPage(page);
  }

  void animateTab(int page) {
    currentpage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
