import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/views/main_view/profile_view/profile_view.dart';

class EditProfileController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void editProfile() {
    if (formKey.currentState!.validate()) {
      Get.to(ProfileView());
    }
  }
}
