import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/ui/shared/utils.dart';

import 'colors.dart';

class CustomYearCourse extends StatelessWidget {
  final int index;
  final String text;
  final Function onTap;
  const CustomYearCourse({
    super.key,
    required this.index,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
          constraints: BoxConstraints(
              minHeight: screenWidth(8.5),
              minWidth: screenWidth(3),
              maxWidth: double.infinity,
              maxHeight: double.infinity),
          height: screenWidth(9),
          decoration: BoxDecoration(
              color: index % 2 == 0
                  ? AppColors.mainLightPurple
                  : AppColors.mainLightBlueColor,
              borderRadius: BorderRadius.circular(
                screenWidth(60),
              )),
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(35),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/ic_reference.svg',
                    width: screenWidth(20),
                  ),
                  SizedBox(
                    width: screenWidth(40),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      text,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: screenWidth(25),
                          color: AppColors.YearseTextColorColor),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(25),
                  ),
                  SvgPicture.asset(
                    'assets/images/ic_arrow.svg',
                  ),
                ],
              ))),
    );
  }
}
