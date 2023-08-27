import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';
import 'package:quiz/ui/views/login_view/login_view.dart';
import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/utils/general_util.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import 'package:http/http.dart' as http;

class SignupController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final selectedRadio = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future qamr() async {
    var headers = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6IitjT3BEWnNjRnhVZTRCcmx4QjEzT0E9PSIsInZhbHVlIjoibkVmeGJZUXVSelFnK3dRb0VpZkt4N2Ftd0RCUWRxaGFlRzhCNTdnM3RsUmVxYnZob1NwNzMrdVJUbEJ6aHRsQmRGVmpFaEZ3K3QyM3llTlNuZTZOM0lZMmdsNWF4TXZtUGpIVGhFY001VHpERlkyVUVhZkI0b282dXIzQzZoWjciLCJtYWMiOiI2MzdhY2YzNzg3MmJhNWIxMWJjM2U2ODRmYWE2ZGQ5YmVjODdkZjMxMjNhZGFhMGUxM2Q3YjY3ODAyODkwY2UyIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6Ik1DQkNBY1hjbzNUSmIvR0RQbHVJRVE9PSIsInZhbHVlIjoiTDVkYXZJekxzMHZ6Ti9sUWtjOHpkSlRIL0VjZ1FyNWZabkk4dWpmL0tlMWt1MjRCMUMvNjZ5ZWt0OVQxTHZRRDhyUXRkZEF1dURyM3BhVlA1ckFLcDVpOFlSNmxIQ2FBMGlQdnZWUFBZeDA3cVIwc05UNXVReWltY21PMHlDb0UiLCJtYWMiOiI3NmMxMGRjMGU0ZGJlYTMwYWM5ZmQ4ZjQxMWEwMjVkZDJjNjExYjEzMTA4N2M1ZjZhZTM2N2Y1ZWUxNWFkMDQ3IiwidGFnIjoiIn0%3D'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://6d90-5-0-32-200.ngrok-free.app/api/register'));
    request.fields.addAll({
      'name': userNameController.text,
      'mobile_phone': codeController.text,
      'specialization_id': '1'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.off(LoginView(), transition: Transition.cupertino);
    } else {
      print(response.reasonPhrase);
    }
  }

  void register() {
    if (formKeySignUp.currentState!.validate()) {
      //    checkConnection(() async {
      runFullLoadingFunction(
          function: UserRepository()
              .register(
        name: userNameController.text,
        mobilePhone: codeController.text,
        specializationId: selectedRadio.value.toString(),
      )
              .then((value) {
        value.fold((l) {
          print(l);
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          Get.off(LoginView(), transition: Transition.cupertino);
        });
      }));
      //   });
    }
  }
}
