import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';
import '../../../../core/data/models/apis/college_model.dart';
import '../../../../core/data/models/apis/specialization_model.dart';
import '../../../../core/data/network/endpoints/home_endpoints.dart';
import '../../../../core/data/repositories/home_repository.dart';
import '../../../../core/enums/Operation_type.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import 'home_data.dart';

class HomeController extends BaseController {
  TextEditingController searchNameController = TextEditingController();

  RxList<SpecializationModel> SpecializationList = <SpecializationModel>[].obs;
  RxList<CollegeModel> CollegeList = <CollegeModel>[].obs;
  RxInt currentTabIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  RxString getSpecialization = SpecializationEndpoints.getAllSpecialization.obs;
  bool get isHomeLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType.contains(OperationType.HOME);

  void getcat() {
    if (currentTabIndex.value == 0) {
      getSpecialization.value =
          SpecializationEndpoints.getAllSpecialization + 'allSpecialization';
    } else {
      getSpecialization.value = SpecializationEndpoints.getAllSpecialization +
          currentTabIndex.value.toString();
    }
  }

  //RxMap<MajorData> results = <MajorData>{}.obs;

  @override
  void onInit() {
    getcat();
    getAllSpecialization();
    getAllColleges();
    super.onInit();
  }

  // void runFilter(String enteredKeyword) {
  //   if (enteredKeyword.isEmpty) {
  //     results.value = categoryList;
  //   } else {
  //     results.value = categoryList.value
  //         .where((user) =>
  //             user.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     ;
  //   }
  //   foundtitle.value = results.value;
  // }
  Future<void> getAllSpecialization() async {
    await runLoadingFutureFunction(
        type: OperationType.HOME,
        function: HomeRepository()
            .getAllSpecialization(getSpecialization.value)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            SpecializationList.clear();
            SpecializationList.addAll(r);
          });
        }));
  }

  Future<void> getAllColleges() async {
    await runLoadingFutureFunction(
        type: OperationType.HOME,
        function: HomeRepository()
            .getAllColleges(SpecializationEndpoints.getAllColeges)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CollegeList.addAll(r);
          });
        }));
  }
}
