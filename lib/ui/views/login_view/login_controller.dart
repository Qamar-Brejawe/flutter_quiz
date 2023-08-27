import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/core/services/base_controller.dart';
import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/utils/general_util.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/main_view.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class LoginController extends BaseController {
  TextEditingController userNameController =
      TextEditingController(text: "Admin");
  TextEditingController codeController = TextEditingController(text: "2wKA0i");
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future qamr() async {
    var headers = {'n': ''};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://6d90-5-0-32-200.ngrok-free.app/api/login'));
    request.fields.addAll({
      'name': userNameController.text,
      'login_code': codeController.text,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      if (formKeyLogin.currentState!.validate()) {
        //    checkConnection(() async {

        Get.off(MainView());

        //   });
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  void login() {
    if (formKeyLogin.currentState!.validate()) {
      //    checkConnection(() async {
      runFullLoadingFunction(
          function: UserRepository()
              .login(
        name: userNameController.text,
        loginCode: codeController.text,
      )
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setLoggedIN(true);
          storage.setTokenInfo(r);
          Get.off(MainView(), transition: Transition.cupertino);
        });
      }));
      //   });
    }
  }
}
