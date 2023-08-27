import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/enums/bottom_navigation.dart';

class MainController extends GetxController {
  final select = BottomNavigationEnum.HOME.obs;
  final pageControler = PageController(initialPage: 2);

  void onTap(BottomNavigationEnum selected, int pageNumber) {
    select.value = selected;
    pageControler.jumpToPage(pageNumber);
  }
}
