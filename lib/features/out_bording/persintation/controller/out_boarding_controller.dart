import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OutBoardingController extends GetxController {
  int pageIndex = 0;
  late PageController pageController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}
