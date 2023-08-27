import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz/core/translations/app_translations.dart';
import 'package:quiz/ui/shared/colors.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_textfield.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/shared/utils.dart';
import 'package:quiz/ui/views/course_options_view/course_options_view.dart';
import 'package:quiz/ui/views/courses_view/courses_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/enums/bottom_taps.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_gridview.dart';
import '../../../shared/custom_widgets/custom_slider.dart';
import '../../login_view/login_view.dart';
import '../../signup_view/signup_view.dart';
import 'home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      text: "الرئيسية",
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.only(top: screenWidth(4.5)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hitText: "بحث",
                  controller: controller.searchNameController,
                  imageNamePrefix: "ic_search",
                  visibleImagePrefixIcon: true,
                  hintColor: AppColors.SearchgrayColor,
                  fillColor: AppColors.mainQrayColor.withOpacity(0.2),
                  imagePrefixColor: AppColors.mainTextColor1,
                  width: screenWidth(1),
                  height: screenWidth(9.5),
                ),
                CustomSlider(
                  //currentIndexPage: controller.currentIndex.value,
                  items: imageList,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenWidth(200),
                        right: screenWidth(20),
                        bottom: screenWidth(20)),
                    child: Row(children: [
                      Container(
                        height: screenWidth(8),
                        width: screenWidth(200),
                        decoration: BoxDecoration(
                          color: AppColors.mainBlackColor,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: AppColors.mainBlackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(25),
                      ),
                      Text(
                        "التصنيفات",
                        style: TextStyle(
                            fontSize: screenWidth(20),
                            fontWeight: FontWeight.bold),
                      ),
                    ])),
                Container(
                  height: screenWidth(8),
                  child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.CollegeList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return tapItem(
                            onTap: () {
                              controller.getcat();
                              controller.currentTabIndex.value = 0;
                              print("qamat");
                            },
                            text: "الكل",
                            isSelected: controller.currentTabIndex.value == 0
                                ? true
                                : false);
                      } else {
                        return tapItem(
                            onTap: () {
                              controller.getcat();
                              controller.currentTabIndex.value = index;
                            },
                            text:
                                controller.CollegeList[index - 1].collageName!,
                            isSelected:
                                controller.currentTabIndex.value == index
                                    ? true
                                    : false);
                      }
                    },
                  ),
                ),
                // Wrap(
                //   alignment: WrapAlignment.center,
                //   children: List.generate(items.length, (index) {
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: SpecilizeItem(
                //           //  imageName: i,
                //           specilizeName: items[index]),
                //     );
                //   }),
                // ),
                CustomGrideView(
                    children: List.generate(
                        controller.SpecializationList.length, (index) {
                  return SpecilizeItem(
                      imageName: controller.SpecializationList[index].image,
                      specilizeName: controller
                          .SpecializationList[index].specializationName!);
                }))
              ],
            ),
          ),
        );
      }),
    );
  }
}

List<String> items = [
  "'طب البشري",
  "طب الاسنان",
  "الصيدلة",
  "التمريض",
  "هندسة المعلوماتية",
  "همدسة المعمارية",
  "الصيدلة",
  "التمريض",
  "هندسة المعلوماتية",
  "همدسة المعمارية",
  "هندسة المعلوماتية",
  "همدسة المعمارية",
  "هندسة المعلوماتية",
  "همدسة المعمارية",
  "هندسة المعلوماتية",
  "همدسة المعمارية",
];

// Get.bottomSheet(
//   Container(
//     height: screenWidth(3),
//     width: screenWidth(30),
//     decoration: new BoxDecoration(
//         color: Colors.white,
//         borderRadius: new BorderRadius.only(
//             topLeft: Radius.circular(screenWidth(10)),
//             topRight: Radius.circular(screenWidth(10)))),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         CustomButton(
//           text: "ماستر",
//           backgroundColor: AppColors.mainDarkPurple,
//           textColor: AppColors.mainWhiteColor,
//           borderColor: AppColors.mainDarkPurple,
//           textSize: screenWidth(23),
//           width: screenWidth(4.7),
//           hight: screenWidth(10),
//           onPressed: () {
//             Get.to(CoursesView());
//           },
//           raduis: screenWidth(40),
//         ),
//         CustomButton(
//           text: "تخرج",
//           backgroundColor: AppColors.mainBlueColor,
//           textColor: AppColors.mainWhiteColor,
//           borderColor: AppColors.mainBlueColor,
//           textSize: screenWidth(23),
//           width: screenWidth(4.7),
//           hight: screenWidth(10),
//           raduis: screenWidth(40),
//         ),
//         ],
//       ),
//     ),
//   );
// },

Widget tapItem({
  required String text,
  required bool isSelected,
  required Function onTap,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Padding(
      padding: EdgeInsets.only(
          bottom: screenWidth(30),
          right: screenWidth(20),
          left: screenWidth(20)),
      child: Container(
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(
                color:
                    isSelected ? AppColors.mainBlueColor : Colors.transparent,
                width: 2)),
        child: Padding(
          padding: EdgeInsets.only(bottom: screenWidth(70)),
          child: Text(text,
              style: TextStyle(
                fontSize: screenWidth(18),
                color: isSelected
                    ? AppColors.mainBlueColor
                    : AppColors.mainBlackColor,
              )),
        ),
      ),
    ),
  );
}

final List<String> imageList = [
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/301',
  'https://picsum.photos/200/302',
];
Widget SpecilizeItem({String? imageName, required String specilizeName}) {
  return Column(
    children: [
      CachedNetworkImage(
        height: screenWidth(5),
        width: screenWidth(5),
        imageUrl: imageName ?? 'http://via.placeholder.com/50x50',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      Text(
        specilizeName,
        style: TextStyle(fontSize: screenWidth(30)),
      ),
    ],
  );
}
