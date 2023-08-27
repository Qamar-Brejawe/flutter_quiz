import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/views/main_view/main_view.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_textfield.dart';
import '../../shared/custom_widgets/text_widget.dart';
import '../../shared/utils.dart';
import '../signup_view/signup_view.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKeyLogin,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight(35), bottom: screenHeight(90)),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.w800,
                      color: AppColors.mainBlackColor,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/Login.svg',
                  width: screenWidth(3),
                  height: screenWidth(3),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth(1.6),
                    top: screenHeight(35),
                  ),
                  child: TextWidget(
                    text: "اسم المستخدم",
                    textColor: AppColors.mainDarkPurple,
                    textSize: screenWidth(21),
                  ),
                ),
                CustomTextField(
                  hitText: "اسم المستخدم",
                  imageNamePrefix: "ic_user",
                  visibleImagePrefixIcon: true,
                  controller: controller.userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'هل من الممكن التأكد من  ادخال اسم المستخدم';
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth(1.5),
                  ),
                  child: TextWidget(
                      text: "رمز الدخول",
                      textColor: AppColors.mainDarkPurple,
                      textSize: screenWidth(21)),
                ),
                CustomTextField(
                    imageNamePrefix: "ic_key",
                    visibleImagePrefixIcon: true,
                    hitText: "رمز الدخول",
                    controller: controller.codeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هل من الممكن التأكد من ادخال رمز الدخول';
                      }
                    }),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth(20)),
                  child: CustomButton(
                    text: "تسجيل  الدخول ",
                    textColor: AppColors.mainWhiteColor,
                    backgroundColor: AppColors.mainDarkPurple,
                    onPressed: () {
                      controller.login();
                      //controller.qamr();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth(4),
                      top: screenHeight(80),
                      bottom: screenHeight(7)),
                  child: Row(
                    children: [
                      Text("ليس لديك حساب؟",
                          style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: screenWidth(25))),
                      InkWell(
                          onTap: () => Get.to(SignupView()),
                          child: Text(
                            "أنشأ حسابك الان",
                            style: TextStyle(
                                color: AppColors.mainPurple,
                                fontSize: screenWidth(25)),
                          )),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.to(MainView());
                    },
                    child: Text(
                      "المتابعة كزائر",
                      style: TextStyle(
                          fontSize: screenWidth(23),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
