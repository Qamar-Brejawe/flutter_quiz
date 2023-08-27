import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/shared/utils.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import 'course_options_controller.dart';

class CourseOptionsView extends StatelessWidget {
  const CourseOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    CourseOptionsController controller = Get.put(CourseOptionsController());
    return CustomWidget(
      text: "كلية الهندسة المعلوماتية / الشبكات",
      body: Padding(
        padding: EdgeInsets.only(top: screenWidth(2.3)),
        child: Center(
          child: Column(
            children: [
              CustomButton(
                text: "دورات",
                textColor: AppColors.mainWhiteColor,
                backgroundColor: AppColors.mainBlueColor,
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth(8)),
                child: CustomButton(
                  text: "أسئلة الكتاب ",
                  textColor: AppColors.mainWhiteColor,
                  backgroundColor: AppColors.mainDarkPurple,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
