import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/data/models/apis/specialization_model.dart';
import 'package:quiz/core/services/base_controller.dart';
import '../../../core/data/network/endpoints/home_endpoints.dart';
import '../../../core/data/repositories/home_repository.dart';
import '../../../core/enums/Operation_type.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/utils/general_util.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/main_view.dart';
import 'package:http/http.dart' as http;

class OverlayRegisterController extends BaseController {
  TextEditingController feedBackNameController = TextEditingController();
  RxList<SpecializationModel> HomeList = <SpecializationModel>[].obs;
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final selectedRadio = 1.obs;
  RxInt currentIndexPage = 0.obs;
  @override
  void onInit() {
    if (storage.getLogIn()) Get.off(MainView());
    // getAllGategory();
    super.onInit();
  }

  Future<void> qamar() async {
    var headers = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6InFnNlUvWnJ3T1JnYVAySkpsT0xnSHc9PSIsInZhbHVlIjoiZEYwMUh4ajdRV01uNXpRWE95K2xYMXNXY3dRbUhIMEE5TWVGSHhiVWR3a1A3c0FtNGt2R2hJbTJNU2ZSNjRUVVdnMlUxNithNkVwTkZDWERPSzIreHJSRENZdGFCRjNvaGdkbndlTHRpYy9McklqYmRJdm9pTU9EMmFqSnRtb3IiLCJtYWMiOiJlMTNhODc0MTQ4YzcyZGIzOGZlOGZmZjBjMWU4MjZmNzgwYzdlMmIwMTc0NDg4NzJlNThlMTIxZjdhZjlkYjE5IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Iit4bmhMMTJJekZnVm1oYkc1dTl0a2c9PSIsInZhbHVlIjoiYUpudVp4dzMybXNKanNXcEdjZjFDZVMrcUZJck9lSWtOYUd2LzRadXRreHVuTlE4NHFkWlZkTVFnNUJKSGtHWXp3ZVJjWGJSclB1Wm5iVFVBc2xZeDkrdVhXaG0vdzhMVGhSUkhhSnM5RUxlVHBTVVFETC9ZcEp3RmRKa08wd1giLCJtYWMiOiIwNThhZGZhZmYxNzJiYTY0Yzc3MjJkYzNiMzVmMjZjY2UyNmE1MjRkYWZmNTdkYWJlYTdhMDkyMTc4ZGM2ZmYyIiwidGFnIjoiIn0%3D'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://6d90-5-0-32-200.ngrok-free.app/api/Specialization/all'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  // Future<void> getAllGategory() async {
  //   await runLoadingFutureFunction(
  //       type: OperationType.HOME,
  //       function: HomeRepository()
  //           .getAll(SpecializationEndpoints.getAllSpecialization)
  //           .then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(
  //               message: l, messageType: MessageType.REJECTED);
  //         }, (r) {
  //           HomeList.addAll(r);
  //         });
  //       }));
  // }
}
