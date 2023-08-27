import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';
import 'package:quiz/ui/views/years_courses_view/years_courses_controller.dart';
import '../../shared/colors.dart';
import '../../shared/custom_year_course.dart';
import '../../shared/utils.dart';

class YearsCoursesView extends StatefulWidget {
  const YearsCoursesView({super.key});
  @override
  State<YearsCoursesView> createState() => _YearsCoursesViewState();
}

class _YearsCoursesViewState extends State<YearsCoursesView> {
  YearsCoursesController controller = Get.put(YearsCoursesController());
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
        text: "الدورات",
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: screenWidth(4.5)),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(30),
                          vertical: screenWidth(30),
                        ),
                        child: CustomYearCourse(
                            index: index,
                            onTap: () {
                              ;
                            },
                            text: ' دورة تشرين 2023'));
                  }))
        ]));
  }
}
