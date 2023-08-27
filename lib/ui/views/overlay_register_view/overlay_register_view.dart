// // import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:quiz/ui/shared/colors.dart';
// import 'package:quiz/ui/shared/utils.dart';
// import 'overlay_register_controller.dart';
// import 'package:shimmer/shimmer.dart';

// class Am extends StatefulWidget {
//   const Am({super.key});

//   @override
//   State<Am> createState() => _AmState();
// }

// class _AmState extends State<Am> {
//   OverlayRegisterController controller = Get.put(OverlayRegisterController());

// }

// // First we check if the ViewModel is busy (isBusy :) definitely) and display the Shimmer
// //Text
// //           Text(
// //             'Score ' '$resultScore',
// //             style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// //             textAlign: TextAlign.center,
// //           ), //Text
// //           TextButton(
// //             onPressed: resetHandler(),
// //             child: Container(
// //               color: Colors.green,
// //               padding: const EdgeInsets.all(14),
// //               child: const Text(
// //                 'Restart Quiz',
// //                 style: TextStyle(color: Colors.blue),
// //               ),
// //             ),
// //           ),
// // FlatButton is deprecated and should not be used
// // Use TextButton instead

// // FlatButton(
// //   child: Text(
// //     'Restart Quiz!',
// //   ), //Text
// //   textColor: Colors.blue,
// //   onPressed: resetHandler(),
// //           // ), //FlatButton
// //         ], //<Widget>[]
// //       ), //Column
// //     ); //Center
// //   }
// // }

// // Create a custom ListView builder
// //     Obx(() {
// //   return Wrap(
// //     alignment: WrapAlignment.center,
// //     children: List.generate(controller.HomeList.length, (index) {
// //       return Container(
// //         width: MediaQuery.of(context).size.width /
// //             4, // divide by 4 to show 4 items per row
// //         child: SpecilizeItem(
// //             // imageName: controller.HomeList[index].image,
// //             specilizeName:
// //                 controller.HomeList[index].specializationName!),
// //       );
// //     }),
// //   );
// // })
// //     Obx(() {
// //   return Wrap(
// //     alignment: WrapAlignment.center,
// //     children: List.generate(items.length, (index) {
// //       return Container(
// //           width: MediaQuery.of(context).size.width /
// //               4, // divide by 4 to show 4 items per row
// //           child: ListTile(
// //             title: SpecilizeItem(
// //               imageName: controller.HomeList[index].image!,
// //               specilizeName:
// //                   controller.HomeList[index].specializationName!,
// //             ),
// //           ));
// //     }),
// //   );
// // })

// // Column(
// //   children: [
// //     Expanded(
// //       child: Builder(builder: (context) {
// //         return Padding(
// //           padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
// //           child: ListView(
// //             primary: true,
// //             shrinkWrap: true,
// //             children: <Widget>[
// //               Wrap(
// //                 spacing: screenWidth(40),
// //                 alignment: WrapAlignment.center,
// //                 runSpacing: screenWidth(40),
// //                 children: List<Widget>.generate(
// //                     company.length, // place the length of the array here
// //                     (int index) {
// //                   return CoursesItem(
// //                       Textlable: company[index], onTaped: () {});
// //                 }).toList(),
// //               ),
// //             ],
// //           ),
// //         );
// //       }),
// //     ),
// //   ],
// // ),

// //     Obx(() {
// //   return Column(
// //     children: [
// //       Expanded(
// //         child: ListView.builder(
// //           shrinkWrap: true,
// //           itemCount: controller.HomeList.length,
// //           itemBuilder: (context, index) {
// //             return SpecilizeItem(
// //                 imageName: controller.HomeList[index].image,
// //                 specilizeName:
// //                     controller.HomeList[index].specializationName!);
// //           },
// //         ),
// //       ),
// //     ],
// //   );
// // }),
// //   Container(
// //   width: double.infinity,
// //   child: Wrap(
// //     alignment: WrapAlignment.ce,
// //     children: _generateChildren(),
// //     // spacing: 8.0,
// //     // runSpacing: 1
// //   ),

// List<String> items = [
//   "'طب البشري",
//   "طب الاسنان",
//   "الصيدلة",
//   "التمريض",
//   "هندسة المعلوماتية",
//   "همدسة المعمارية",
// ];
// List<List<int>> generateRowsInColumns(int itemsNumber) {
//   List<List<int>> rows = [];
//   List<int> currentRow = [];

//   for (int i = 0; i < itemsNumber; i++) {
//     if (currentRow.length < 4) {
//       currentRow.add(i);
//     } else {
//       rows.add(currentRow);
//       currentRow = [i];
//     }
//   }

//   if (currentRow.isNotEmpty) {
//     rows.add(currentRow);
//   }

//   return rows;
// }

// // );

// // : Padding(
// //     padding: EdgeInsets.symmetric(
// //       horizontal: screenWidth(30),
// //       vertical: screenWidth(30),
// //     ),
// //     child: Row(
// //       children: [
// //         SpecilizeItem(
// //             imageName: "ic_user", specilizeName: "math")
// //],
// //  ));
// //                   }))
// //         ],
// //       ),
// //     ));
// //   }
// // }

// //   Widget SpecilizeItem({String? imageName, required String specilizeName}) {
// //     return Column(
// //       children: [
// //         CachedNetworkImage(
// //           height: screenWidth(5),
// //           width: screenWidth(5),
// //           imageUrl: imageName ?? 'http://via.placeholder.com/50x50',
// //           placeholder: (context, url) => CircularProgressIndicator(),
// //           errorWidget: (context, url, error) => Icon(Icons.error),
// //         ),
// //         Text(
// //           specilizeName,
// //           style: TextStyle(fontSize: screenWidth(30)),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget RadioItem({
// //     required int value,
// //     required String textItem,
// //   }) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       children: [
// //         Transform.scale(
// //           scale: 20 / 20,
// //           child: Radio(
// //             value: value,
// //             groupValue: controller.selectedRadio.value,
// //             onChanged: (value) => controller.selectedRadio.value = value!,
// //             fillColor: MaterialStateColor.resolveWith(
// //               (states) => AppColors.mainDarkPurple,
// //             ),
// //           ),
// //         ),
// //         Text(
// //           textItem,
// //           maxLines: 1,
// //           style: TextStyle(
// //             fontSize: screenWidth(20),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class CustomGrideView extends StatelessWidget {
// //   final List<Widget> children;

// //   CustomGrideView({required this.children});

// //   @override
// //   Widget build(BuildContext context) {
// //     if (children.length <= 4) {
// //       return Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: children);
// //     } else {
// //       return Column(
// //         children: [
// //           Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: children.sublist(0, 4)),
// //           CustomGrideView(children: ch
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_button.dart';
import 'package:quiz/ui/shared/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_slider.dart';
import '../../shared/custom_widgets/custom_textfield.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../login_view/login_view.dart';
import '../signup_view/signup_view.dart';
import 'overlay_register_controller.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  OverlayRegisterController controller = Get.put(OverlayRegisterController());
  int _currentQuestionIndex = 0;
  bool x = true;
  List<int> _selectedAnswers = [];
  int correctAnswers = 0;
  int erroranswer = 0;

  void _selectAnswer(int answerId) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answerId;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      if ((correctAnswers + erroranswer) != _currentQuestionIndex) {
        correctAnswers = _currentQuestionIndex - erroranswer;
      }
    });
  }

  void backQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List.filled(questions.length, -1);
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= questions.length) {
      // All questions have been answered
      return Column(
        children: [
          Text('Quiz completed!', style: TextStyle(fontSize: screenWidth(20))),
          Text('$correctAnswers', style: TextStyle(fontSize: screenWidth(20))),
        ],
      );
    }

    final currentQuestion = questions[_currentQuestionIndex];

    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.amber,
            body: x
                ? Shimmer.fromColors(
                    period: Duration(milliseconds: 100),
                    baseColor: Colors.grey,
                    highlightColor:
                        Color.fromARGB(255, 149, 146, 146).withOpacity(0.5),
                    child: QuestionWidget())
                : Column(
                    children: [
                      Container(
                        child: Lottie.asset(
                          'assets/lottie/4.json',
                        ),
                      ),
                      CustomButton(
                        text: "text",
                        onPressed: () {
                          CustomToast.showMessage(message: "qamar");
                        },
                      ),
                      // Shimmer.fromColors(
                      //   baseColor: Colors.grey,
                      //   highlightColor: Color.fromARGB(255, 149, 146, 146).withOpacity(0.5),
                      //   child:
                      // )
                    ],
                  )));
    // Get.dialog(
    //   Container(
    //     width: screenWidth(1.15),
    //     height: screenHeight(1.7),
    //     decoration: BoxDecoration(
    //       color: AppColors.mainWhiteColor,
    //       borderRadius:
    //           BorderRadius.all(Radius.circular(screenWidth(70))),
    //       border: Border.all(
    //         color: AppColors.mainDarkPurple,
    //         width: screenWidth(170),
    //       ),
    //     ),
    //     alignment: Alignment.center,
    //     child: Stack(

    //       children: [Column(
    //         //  alignment: Alignment.topCenter,
    //         children: [
    //           // Positioned(
    //           //   left: 0,
    //           //   top: 0,
    //           //   child: Material(
    //           //     child: InkWell(
    //           //       onTap: () => Get.back(),
    //           //       child: SvgPicture.asset(
    //           //         'assets/images/ic_close.svg',
    //           //         width: screenWidth(22),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //           SvgPicture.asset(
    //             'assets/images/pop-up.svg',
    //             width: screenWidth(4),
    //           ),
    //           SizedBox(
    //             height: screenWidth(30),
    //           ),
    //           Material(
    //             child: CustomTextField(
    //               hitText: "ارسل شكوى/ مقترح",
    //               controller: controller.feedBackNameController,
    //               hintColor: Colors.grey,
    //               fillColor: Colors.grey.withOpacity(0.1),
    //               start: screenWidth(40),
    //               end: screenWidth(40),
    //               maxline: 8,
    //               maxlength: 500,
    //               bottom: screenWidth(40),
    //             ),
    //           ),
    //           CustomButton(
    //             textSize: screenWidth(25),
    //             text: "ارسل",
    //             textColor: AppColors.mainWhiteColor,
    //             backgroundColor: AppColors.mainDarkPurple,
    //             width: screenWidth(1.5),
    //             hight: screenWidth(10),
    //             onPressed: () {},
    //           ),
    //         ],
    //       ),
    //     ]),
    //       ),
    //     );
    //   },
    // ))));
  }
}

class MyDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    OverlayRegisterController controller = Get.put(OverlayRegisterController());
    return Container(
      // width: screenWidth(1.15),
      // height: screenHeight(1.7),
      decoration: BoxDecoration(
        color: AppColors.mainWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth(70))),
        border: Border.all(
          color: AppColors.mainDarkPurple,
          width: screenWidth(170),
        ),
      ),
      alignment: Alignment.center,
      child: Stack(children: [
        Column(
          //  alignment: Alignment.topCenter,
          children: [
            // Positioned(
            //   left: 0,
            //   top: 0,
            //   child: Material(
            //     child: InkWell(
            //       onTap: () => Get.back(),
            //       child: SvgPicture.asset(
            //         'assets/images/ic_close.svg',
            //         width: screenWidth(22),
            //       ),
            //     ),
            //   ),
            // ),
            SvgPicture.asset(
              'assets/images/pop-up.svg',
              width: screenWidth(4),
            ),
            SizedBox(
              height: screenWidth(30),
            ),
            Material(
              child: CustomTextField(
                hitText: "ارسل شكوى/ مقترح",
                controller: controller.feedBackNameController,
                hintColor: Colors.grey,
                fillColor: Colors.grey.withOpacity(0.1),
                start: screenWidth(40),
                end: screenWidth(40),
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
              width: screenWidth(1.5),
              hight: screenWidth(10),
              onPressed: () {},
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(20),
              highlightColor: Colors.grey.withOpacity(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text',
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}

List<Widget> items = [
  SvgPicture.asset('assets/images/ic_feed.svg', fit: BoxFit.cover),
  SvgPicture.asset('assets/images/ic_mail.svg', fit: BoxFit.cover),
  SvgPicture.asset('assets/images/ic_back.svg', fit: BoxFit.cover),
  SvgPicture.asset('assets/images/ic_arrow.svg', fit: BoxFit.cover),
  SvgPicture.asset('assets/images/ic_close.svg', fit: BoxFit.cover),
];

List<Map<String, dynamic>> questions = [
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      },
    ],
    'correct_id': 1,
  },
  {
    'questionText': 'Qqqqqqqqqqqqqqqqqq2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
  {
    'questionText': 'Q2. What is Flutter?',
    'answers': [
      {'text': 'Android Development Kit', 'id': 1},
      {'text': 'IOS Development Kit', 'id': 2},
      {'text': 'Web Development Kit', 'id': 3},
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 4,
      },
      {
        'text':
            'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
        'id': 5,
      }
    ],
    'correct_id': 1
  },
];
