import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/ui/shared/colors.dart';
import '../../../core/enums/message_type.dart';
import '../utils.dart';

class CustomToast {
  static showMessage(
      {required String message, MessageType? messageType = MessageType.INFO}) {
    BotToast.showCustomText(
      duration: Duration(seconds: 6),
      toastBuilder: (cancelFunc) {
        String imageName;
        Color shadowColor;

        switch (messageType!) {
          case MessageType.INFO:
            imageName = 'info';
            shadowColor = AppColors.mainDarkPurple;
            break;

          case MessageType.WARNING:
            imageName = 'warning';
            shadowColor = AppColors.mainDarkPurple;
            break;

          case MessageType.REJECTED:
            imageName = 'rejected-01';
            shadowColor = AppColors.mainDarkPurple;
            break;

          case MessageType.SUCCESS:
            imageName = 'approved1-01';
            shadowColor = AppColors.mainDarkPurple;
            break;
        }

        return GestureDetector(
          onTap: cancelFunc, // Dismiss the toast when tapped
          child: Container(
            width: screenWidth(2),
            height: screenWidth(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth(10)),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/4.json', width: screenWidth(7)),
                SizedBox(
                  height: screenWidth(15),
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: screenWidth(30),
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
