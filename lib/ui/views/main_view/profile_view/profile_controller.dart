import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/data/models/apis/profile_info_model.dart';
import 'package:quiz/core/data/repositories/profile_repository.dart';
import 'package:quiz/core/services/base_controller.dart';

import '../../../../core/enums/message_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import '../../edit-profile_view/edit_profile._view.dart';

class ProfileController extends BaseController {
  TextEditingController feedBackNameController = TextEditingController();
  RxList<ProfileInfoModel> ProfileInfoList = <ProfileInfoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void profileInfo() {
    //    checkConnection(() async {
    runLoadingFutureFunction(
        function: ProfileRepository().getall().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        ProfileInfoList.addAll(r);
        Get.off(EditProfileView(), transition: Transition.cupertino);
      });
    }));
  }
}
