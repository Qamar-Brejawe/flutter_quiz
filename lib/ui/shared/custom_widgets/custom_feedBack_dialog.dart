import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../utils.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class CustomFeedBackDialog extends StatelessWidget {
  final TextEditingController feedBackNameController;
  const CustomFeedBackDialog({super.key, required this.feedBackNameController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: screenWidth(0.95),
        width: screenWidth(1.1),
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth(60)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/ic_feed.svg',
                  width: screenWidth(3),
                  height: screenWidth(3.5),
                ),
                SizedBox(
                  height: screenWidth(30),
                ),
                Material(
                  child: CustomTextField(
                    hitText: "ارسل شكوى/ مقترح",
                    hintSize: screenWidth(30),
                    controller: feedBackNameController,
                    hintColor: Colors.grey,
                    fillColor: Colors.grey.withOpacity(0.1),
                    maxline: 8,
                    maxlength: 500,
                    bottom: screenWidth(40),
                  ),
                ),
                CustomButton(
                  textSize: screenWidth(25),
                  text: "ارسل",
                  textColor: AppColors.mainWhiteColor,
                  backgroundColor: AppColors.mainDarkPurple,
                  width: screenWidth(1.26),
                  hight: screenWidth(10),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
