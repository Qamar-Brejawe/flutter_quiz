import 'package:get/get.dart';
import 'package:quiz/ui/views/login_view/login_view.dart';
import 'package:quiz/ui/views/main_view/main_view.dart';

import '../../../core/utils/general_util.dart';

class SplashScreenController extends GetxController {
  get cartService => null;

  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 8)).then((value) {
      Get.off(storage.getLogIn() ? MainView() : LoginView());
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}
