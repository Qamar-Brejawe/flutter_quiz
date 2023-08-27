import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_feedBack_dialog.dart';
import 'package:quiz/ui/views/edit-profile_view/edit_profile._view.dart';
import 'package:quiz/ui/views/application_details_view/appliction_details_view.dart';
import 'package:quiz/ui/views/main_view/profile_view/profile_controller.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_textfield.dart';
import '../../../shared/custom_widgets/custom_widget.dart';
import '../../../shared/utils.dart';
import '../../login_view/login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        imageName: "ic_profile_user",
        visiblShapeMaker: true,
        text: "الملف الشخصي ",
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: screenWidth(4)),
            child: Container(
              width: screenWidth(3.7),
              height: screenWidth(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainWhiteColor,
                  border: Border.all(
                      color: AppColors.mainBlueColor, width: screenWidth(150))),
              child: Stack(
                children: [
                  Positioned(
                    top: screenWidth(40),
                    right: screenWidth(170),
                    child: UnconstrainedBox(
                      child: SvgPicture.asset(
                        "assets/images/User.svg",
                        color: AppColors.mainBlueColor,
                        width: screenWidth(4),
                        height: screenWidth(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: screenWidth(35), bottom: screenWidth(35)),
            child: Text(
              "اسم المستخدم",
              style: TextStyle(fontSize: screenWidth(18)),
            ),
          ),
          RowOfDetails(
            colorofItem: AppColors.mainDarkPurple,
            text: 'المعلومات الشخصية',
            imageName: 'ic_edit',
            onTap: () {
              controller.profileInfo();
              // Get.to(EditProfileView());
            },
          ),
          RowOfDetails(
              colorofItem: AppColors.mainBlueColor,
              text: 'ارسل شكاوي',
              imageName: 'ic_send',
              onTap: () {
                Get.dialog(
                    CustomFeedBackDialog(
                        feedBackNameController:
                            controller.feedBackNameController),
                    barrierDismissible: false);
              }),
          RowOfDetails(
            colorofItem: AppColors.mainBlackColor,
            text: 'عن التطبيق',
            imageName: 'ic_info',
            onTap: () {
              Get.to(
                ApplicationDetailsView(),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: screenWidth(23)),
            child: CustomButton(
              text: "تسجيل الخروج",
              onPressed: () {
                Get.off(LoginView());
              },
            ),
          )
        ]));
  }
}

Widget RowOfDetails(
    {required Color colorofItem,
    required String text,
    required String imageName,
    required Function onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: screenWidth(40), horizontal: screenWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: screenWidth(8),
              width: screenWidth(120),
              decoration: BoxDecoration(
                color: colorofItem,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: colorofItem,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth(33)),
              child: Text(
                text,
                style: TextStyle(fontSize: screenWidth(22), color: colorofItem),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: SvgPicture.asset(
            "assets/images/$imageName.svg",
            width: screenWidth(17),
            height: screenWidth(17),
            color: colorofItem,
          ),
        )
      ],
    ),
  );
}

void showNFCWriteDialog(
    {required TextEditingController feedBackNameController}) {
  // RxBool loading = isLoading.obs;
  Get.dialog(
      Container(
        // width: screenWidth(1),
        // height: screenWidth(1.2),
        child: Column(
          children: [
            CustomTextField(
              hitText: "ارسل شكوى/ مقترح",
              controller: feedBackNameController,
              hintColor: AppColors.grayColor,
              fillColor: AppColors.grayColor.withOpacity(0.1),
              //  vertical: screenWidth(20),
              //   srart: screenWidth(200),
              // end: screenWidth(200),
              maxline: 8,
              maxlength: 500,
              // bottom: screenWidth(40),
            ),
            CustomButton(
              textSize: screenWidth(25),
              text: "ارسل",
              textColor: AppColors.mainWhiteColor,
              backgroundColor: AppColors.mainDarkPurple,
              width: screenWidth(1.4),
              hight: screenWidth(10),
              onPressed: () {},
            ),
          ],
        ),
      ),
      barrierColor: AppColors.mainWhiteColor);
}
