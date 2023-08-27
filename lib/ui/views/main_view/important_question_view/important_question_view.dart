import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';

import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/utils.dart';
import '../../login_view/login_view.dart';
import '../../signup_view/signup_view.dart';
import 'important_question_controller.dart';

class ImportantQuestionView extends StatefulWidget {
  const ImportantQuestionView({super.key});

  @override
  State<ImportantQuestionView> createState() => _ImportantQuestionViewState();
}

class _ImportantQuestionViewState extends State<ImportantQuestionView> {
  ImportantQuestionController controller =
      Get.put(ImportantQuestionController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: "الأسئلة المهمة",
        body: Padding(
          padding: EdgeInsets.only(top: screenWidth(5)),
          child: Column(children: [
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: screenWidth(16)),
                    shrinkWrap: true,
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth(30),
                            vertical: screenWidth(40),
                          ),
                          child: questionItem(
                              questionText:
                                  "1. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :"));
                    }))
          ]),
        ));
  }
}

Widget questionItem({required String questionText}) {
  return InkWell(
    onTap: () {},
    child: Container(
      constraints: BoxConstraints(
          minHeight: screenWidth(7),
          minWidth: screenWidth(3),
          maxWidth: double.infinity,
          maxHeight: double.infinity),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.questionColor,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: AppColors.questionColor,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(70),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  questionText,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: screenWidth(23),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(27),
              ),
              SvgPicture.asset(
                "assets/images/ic_arrow.svg",
                width: screenWidth(17),
                height: screenWidth(17),
              )
            ],
          )),
    ),
  );
}
    //   Text(
    //     "ImportantQuestionView",
    //     style: TextStyle(fontSize: 30),
    //   ),
    //   IconButton(
    //       icon: Icon(
    //         Icons.language,
    //       ),
    //       onPressed: () {
    //         Get.dialog(
    //           AlertDialog(
    //             shape: RoundedRectangleBorder(
    //               borderRadius:
    //                   BorderRadius.all(Radius.circular(screenWidth(50))),
    //               side: BorderSide(color: AppColors.mainDarkPurple),
    //             ),
    //             contentPadding: EdgeInsets.symmetric(
    //               horizontal: screenHeight(18),
    //             ),
    //             content: Padding(
    //               padding: EdgeInsets.all(screenWidth(200)),
    //               child: Container(
    //                 width: screenWidth(1),
    //                 height: screenWidth(1.5),
    //                 child: Center(
    //                   child: Column(
    //                     children: [
    //                       SvgPicture.asset(
    //                         'assets/images/pop-up.svg',
    //                         width: screenWidth(3),
    //                         height: screenWidth(3),
    //                       ),
    //                       Text("يرجى الاشتراك لاتمام عملية التصفح",
    //                           style: TextStyle(
    //                             color: AppColors.mainBlackColor,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: screenWidth(24),
    //                           )),
    //                       CustomButton(
    //                         textSize: screenWidth(25),
    //                         text: "تسجيل  الدخول ",
    //                         textColor: AppColors.mainWhiteColor,
    //                         backgroundColor: AppColors.mainDarkPurple,
    //                         width: screenWidth(1.4),
    //                         hight: screenWidth(10),
    //                         onPressed: () {
    //                           Get.off(LoginView());
    //                         },
    //                       ),
    //                       Padding(
    //                         padding: EdgeInsets.only(right: screenWidth(20)),
    //                         child: Row(
    //                           children: [
    //                             Text(
    //                               "ليس لديك حساب ؟",
    //                               style: TextStyle(
    //                                 color: AppColors.mainBlackColor,
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: screenWidth(29),
    //                               ),
    //                             ),
    //                             InkWell(
    //                                 onTap: () {
    //                                   Get.off(SignupView());
    //                                 },
    //                                 child: Text(
    //                                   "أنشأ حسابك الان",
    //                                   style: TextStyle(
    //                                       color: AppColors.mainPurple,
    //                                       fontWeight: FontWeight.bold,
    //                                       fontSize: screenWidth(29)),
    //                                 ))
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),

    //           // barrierColor=AppColors.mainDarkPurple,
    //         );
    //       }),
    //   IconButton(
    //       icon: Icon(
    //         Icons.language,
    //       ),
    //       onPressed: () {
    //         Get.dialog(
    //           AlertDialog(
    //             shape: RoundedRectangleBorder(
    //               borderRadius:
    //                   BorderRadius.all(Radius.circular(screenWidth(70))),
    //               side: BorderSide(
    //                 color: AppColors.mainDarkPurple,
    //                 width: screenWidth(170),
    //                 strokeAlign: BorderSide.strokeAlignInside,
    //               ),
    //             ),
    //             alignment: Alignment.center,
    //             content: Container(
    //               width: screenWidth(1),
    //               height: screenWidth(1.2),
    //               child: Column(
    //                 children: [
    //                   CustomTextField(
    //                     hitText: "ارسل شكوى/ مقترح",
    //                     controller: controller.feedBackNameController,
    //                     hintColor: AppColors.grayColor,
    //                     fillColor: AppColors.grayColor.withOpacity(0.1),
    //                     vertical: screenWidth(20),
    //                     srart: screenWidth(200),
    //                     end: screenWidth(200),
    //                     maxline: 8,
    //                     maxlength: 500,
    //                     bottom: screenWidth(40),
    //                   ),
    //                   CustomButton(
    //                     textSize: screenWidth(25),
    //                     text: "ارسل",
    //                     textColor: AppColors.mainWhiteColor,
    //                     backgroundColor: AppColors.mainDarkPurple,
    //                     width: screenWidth(1.4),
    //                     hight: screenWidth(10),
    //                     onPressed: () {},
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),

    //           //   ),

    //           // barrierColor=AppColors.mainDarkPurple,
    //         );
    //       }),
    //   TextField(
    //     maxLines: 5,
    //     maxLength: 500,

    //     textAlignVertical: TextAlignVertical.bottom,
    //     // textAlign: TextAlign.right,
    //     decoration: InputDecoration(
    //       hintText: 'اؤسل',
    //       alignLabelWithHint: true,
    //       hintStyle: TextStyle(
    //         color: Colors.grey,
    //       ),
    //       border: OutlineInputBorder(
    //         borderSide: BorderSide(
    //           width: 2,
    //           color: Colors.black,
    //         ),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       counterText: '',
    //     ),
    //     scrollPhysics: ScrollPhysics(),
    //   ),
    //   SvgPicture.asset(
    //     "assets/images/a.svg",
    //     // width: screenWidth(17),
    //     // height: screenWidth(17),
    //     //color: colorofItem,
    //   ),
//      ])));
//   }
// }
