import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/core/utils/string_util.dart';
import 'package:quiz/ui/views/signup_view/signup_controller.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_textfield.dart';
import '../../shared/custom_widgets/text_widget.dart';
import '../../shared/utils.dart';
import '../login_view/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
          key: controller.formKeySignUp,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight(35),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenWidth(15),
                          left: screenWidth(4.2),
                        ),
                        child: InkWell(
                          onTap: () => {Get.to(LoginView())},
                          child: SvgPicture.asset(
                            'assets/images/ic_back.svg',
                            width: screenWidth(20),
                            height: screenWidth(17),
                          ),
                        ),
                      ),
                      TextWidget(
                        text: "انشاء حساب",
                        textSize: screenWidth(18),
                        fontWeight: FontWeight.w800,
                        textColor: AppColors.mainBlackColor,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/signup.svg',
                  width: screenWidth(3),
                  height: screenWidth(3),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth(1.6), top: screenHeight(35)),
                  child: TextWidget(
                    text: "اسم المستخدم",
                    textColor: AppColors.mainDarkPurple,
                    textSize: screenWidth(21),
                  ),
                ),
                CustomTextField(
                  hitText: "اسم المستخدم",
                  visibleImagePrefixIcon: true,
                  imageNamePrefix: "ic_user",
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
                      text: " رقم الموبايل",
                      textColor: AppColors.mainDarkPurple,
                      textSize: screenWidth(21)),
                ),
                CustomTextField(
                    hitText: "رقم الموبايل",
                    imageNamePrefix: "ic_phone",
                    imagePrefixColor:
                        AppColors.mainLightPurple.withOpacity(0.5),
                    visibleImagePrefixIcon: true,
                    controller: controller.codeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هل من الممكن التأكد من ادخال رقم الموبايل';
                      }
                    }),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth(1.7)),
                  child: Text(
                    "اختر الاختصاص ",
                    style: TextStyle(
                      color: AppColors.mainDarkPurple,
                      fontSize: screenWidth(21),
                    ),
                  ),
                ),
                Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth(21)),
                        child: Row(
                          children: [
                            RadioItem(textItem: 'الطب البشري', value: 1),
                            RadioItem(textItem: 'طب الأسنان', value: 2),
                            RadioItem(textItem: 'كلية الصيدلة', value: 3),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          RadioItem(textItem: 'الهندسة المعلوماتية', value: 4),
                          RadioItem(textItem: 'الهندسة المعمارية ', value: 5),
                          RadioItem(textItem: ' التمريض', value: 6),
                        ],
                      ),
                    ],
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth(35)),
                  child: CustomButton(
                    text: "انشاء  حساب",
                    textColor: AppColors.mainWhiteColor,
                    backgroundColor: AppColors.mainDarkPurple,
                    onPressed: () {
                      controller.register();
                      //controller.qamr();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth(3.5),
                    top: screenHeight(80),
                  ),
                  child: Row(
                    children: [
                      Text("لديك حساب؟ ",
                          style: TextStyle(
                              color: AppColors.mainBlackColor,
                              fontSize: screenWidth(25))),
                      InkWell(
                          onTap: () => Get.back(),
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: AppColors.mainPurple,
                                fontSize: screenWidth(25)),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }

  Widget RadioItem({
    required int value,
    required String textItem,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Transform.scale(
          scale: 20 / 20,
          child: Radio(
            value: value,
            groupValue: controller.selectedRadio.value,
            onChanged: (value) => controller.selectedRadio.value = value!,
            fillColor: MaterialStateColor.resolveWith(
              (states) => AppColors.mainDarkPurple,
            ),
          ),
        ),
        Text(
          textItem,
          style: TextStyle(fontSize: screenWidth(30)),
        )
      ],
    );
  }
}
