import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_search_slider.dart';
import '../../shared/custom_widgets/custom_textfield.dart';
import '../../shared/utils.dart';
import 'courses_controller.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  CoursesController controller = Get.put(CoursesController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: "كلية الهندسة المعلوماتية",
        body: Padding(
          padding: EdgeInsets.only(top: screenWidth(4)),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              CarouselSlider(
                options: CarouselOptions(
                  height: 140,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, _) {
                    setState(() {
                      controller.currentIndex.value = index;
                    });
                  },
                ),
                items: imageList.map((item) {
                  return Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.map((url) {
                  int index = imageList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: controller.currentIndex.value == index
                          ? AppColors.mainDarkPurple
                          : Colors.grey,
                    ),
                  );
                }).toList(),
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
              Expanded(child: Builder(builder: (context) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
                    child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        children: <Widget>[
                          Wrap(
                            spacing: screenWidth(40),
                            alignment: WrapAlignment.center,
                            runSpacing: screenWidth(40),
                            children: List<Widget>.generate(
                                company
                                    .length, // place the length of the array here
                                (int index) {
                              return CoursesItem(
                                  Textlable: company[index], onTaped: () {});
                            }).toList(),
                          )
                        ]));
              })),
              SizedBox(
                height: screenWidth(20),
              )
            ],
          ),
        ));
  }
}

final List<String> imageList = [
  'https://picsum.photos/200/300',
  'https://picsum.photos/200/301',
  'https://picsum.photos/200/302',
];
List company = [
  "مترجمات",
  "داتا بيز",
  "أتومات",
  "الشبكات",
  "الذكاء الاصطناعي",
  "قواعد المعطيات",
  "هندسة البرمجيات",
  "أمن ",
  "خوارزميات",
];
Widget CoursesItem({required String Textlable, required Function onTaped}) {
  return InkWell(
    onTap: () {
      onTaped();
    },
    child: Chip(
      labelPadding: EdgeInsets.symmetric(
          horizontal: screenWidth(28), vertical: screenWidth(100)),
      backgroundColor: AppColors.mainWhiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth(50))),
      side: BorderSide(
        color: AppColors.mainDarkPurple,
      ),
      label: Text(
        Textlable,
        style: TextStyle(
            color: AppColors.mainDarkPurple, fontSize: screenWidth(18)),
      ),
    ),
  );
}
