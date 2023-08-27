import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';

class CoursesController extends BaseController {
  TextEditingController searchNameController = TextEditingController();
  RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
