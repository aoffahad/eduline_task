import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eduline/core/routes/routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 1) {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
