import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../views/login_view/login_view.dart';
import '../../views/signup_view/signup_view.dart';
import '../colors.dart';
import '../utils.dart';
import 'custom_button.dart';

class CustomLoginAlertDialog extends StatelessWidget {
  const CustomLoginAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: screenWidth(1.35),
        width: screenWidth(1.2),
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(screenWidth(70))),
          border: Border.all(
            color: AppColors.mainDarkPurple,
            width: screenWidth(170),
          ),
        ),
        child: Stack(children: [
          Positioned(
            left: screenWidth(29),
            top: screenWidth(30),
            child: Material(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  'assets/images/ic_close.svg',
                  width: screenWidth(20),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth(70)),
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/pop-up.svg',
                  width: screenWidth(3),
                  height: screenWidth(3.5),
                ),
                SizedBox(
                  height: screenWidth(20),
                ),
                Text(
                  "يرجى الاشتراك لاتمام عملية التصفح",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: screenWidth(26),
                      color: AppColors.mainBlackColor),
                ),
                SizedBox(
                  height: screenWidth(40),
                ),
                CustomButton(
                  textSize: screenWidth(27),
                  text: "تسجيل  الدخول",
                  textColor: AppColors.mainWhiteColor,
                  backgroundColor: AppColors.mainDarkPurple,
                  width: screenWidth(1.4),
                  hight: screenWidth(8),
                  onPressed: () {
                    Get.off(LoginView());
                  },
                ),
                SizedBox(
                  height: screenWidth(100),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "ليس لديك حساب؟",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(26),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(SignupView());
                    },
                    child: Text("أنشأ حسابك الان",
                        style: TextStyle(
                            color: AppColors.mainPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth(33))),
                  )
                ])
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
