import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/views/main_view/profile_view/profile_view.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/custom_textfield.dart';
import '../../shared/custom_widgets/text_widget.dart';
import '../../shared/utils.dart';
import '../signup_view/signup_view.dart';
import 'edit_profile_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  EditProfileController controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        imageName: "ic_profile_user",
        text: "تعديل المعلومات الشخصية",
        body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth(1.6),
                    top: screenHeight(5),
                  ),
                  child: Text(
                    "اسم المستخدم",
                    style: TextStyle(
                        color: AppColors.mainDarkPurple,
                        fontSize: screenWidth(21)),
                  ),
                ),
                CustomTextField(
                  hintColor: AppColors.mainDarkPurple,
                  fillColor: AppColors.mainLightBlueColor,
                  hitText: "قمر البريجاوي",
                  visibleImageSufixIcon: true,
                  visibleImagePrefixIcon: true,
                  imageNamePrefix: "ic_user2",
                  imageNamesufix: "ic_edit",
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
                      text: "رقم الهاتف",
                      textColor: AppColors.mainDarkPurple,
                      textSize: screenWidth(21)),
                ),
                CustomTextField(
                    hintColor: AppColors.mainDarkPurple,
                    fillColor: AppColors.mainLightBlueColor,
                    visibleImageSufixIcon: true,
                    visibleImagePrefixIcon: true,
                    imageNamePrefix: "ic_phone",
                    imageNamesufix: "ic_edit",
                    hintSize: screenWidth(25),
                    hitText: "963-999-999-999+",
                    controller: controller.mobileNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'هل من الممكن التأكد من ادخال رقم الموبايل';
                      }
                    }),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth(3.6)),
                  child: CustomButton(
                    text: "حفظ التغيرات ",
                    textColor: AppColors.mainWhiteColor,
                    backgroundColor: AppColors.mainDarkPurple,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      " تراجع",
                      style: TextStyle(
                          color: AppColors.mainDarkPurple,
                          fontSize: screenWidth(20),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ))));
  }
}
