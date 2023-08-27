import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/views/main_view/main_controller.dart';
import 'package:quiz/ui/views/main_view/important_question_view/important_question_view.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_widget.dart';
import '../../shared/utils.dart';
import 'home_view/home_view.dart';
import 'main_view_widgets/botton_naviction_widget.dart';
import 'notifiction_view/notifiction_view.dart';
import 'profile_view/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CustomWidget(
      visiblShapeMaker: false,
      text: "الرئيسية",
      bottomNavigationBar: Obx(() => BottomNavigationWidget(
            bottomNavigation: controller.select.value,
            onTap: controller.onTap,
          )),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageControler,
        children: [
          ProfileView(),
          ImportantQuestionView(),
          HomeView(),
          NotificationView(),
        ],
      ),
    );
  }
}
