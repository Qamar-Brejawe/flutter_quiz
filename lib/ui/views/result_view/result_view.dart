import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/colors.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_button.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/shared/utils.dart';
import 'package:quiz/ui/views/result_view/result_controller.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  ResultController controller = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        imageName: "ic_back",
        visiblShapeMaker: true,
        text: " النتيجة ",
        body: Padding(
          padding: EdgeInsets.only(top: screenWidth(7)),
          child: Column(
            children: [
              SizedBox(
                height: screenWidth(20),
              ),
              SvgPicture.asset(
                "assets/images/Image-cupsvg",
                width: screenWidth(17),
                height: screenWidth(17),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              Text(
                "مبروك لقد أتممت الاختبار بنجاح ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth(20)),
              ),
              Text("علامتك هي : 80/100",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: screenWidth(20))),
              Divider(
                thickness: 2,
                color: AppColors.mainBlackColor,
                indent: 80,
                endIndent: 90,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth(5)),
                child: Column(
                  children: [
                    Text("عدد الاسئلة الصحيحة :40\nعدد الاسئلة الخاطئة :10",
                        style: TextStyle(
                            color: AppColors.mainBlackColor,
                            fontSize: screenWidth(24))),
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              CustomButton(
                text: "التحقق من الاجابات",
                width: screenWidth(1.8),
                hight: screenWidth(8),
              )
            ],
          ),
        ));
  }
}
