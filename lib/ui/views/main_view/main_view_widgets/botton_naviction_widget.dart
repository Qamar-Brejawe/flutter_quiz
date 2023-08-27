import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/utils.dart';
import '../../../../core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;
  BottomNavigationWidget({
    Key? key,
    required this.bottomNavigation,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        width: 450,
        height: 50,
      ),
      Positioned(
          bottom: size.width * 0.02,
          left: size.width * 0.08,
          // right: size.width * 0.05,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Row(children: [
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PROFILE, 0);
                  },
                  size: size,
                  imageName: 'ic_profile',
                  isSelected:
                      widget.bottomNavigation == BottomNavigationEnum.PROFILE),
              SizedBox(
                width: size.width * 0.1,
              ),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.IMPORTANTQUESTIONS, 1);
                  },
                  size: size,
                  imageName: 'ic_star',
                  isSelected: widget.bottomNavigation ==
                      BottomNavigationEnum.IMPORTANTQUESTIONS),
              SizedBox(
                width: size.width * 0.1,
              ),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 2);
                  },
                  size: size,
                  imageName: 'ic_home',
                  isSelected:
                      widget.bottomNavigation == BottomNavigationEnum.HOME),
              SizedBox(
                width: size.width * 0.1,
              ),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.NOTIFICATION, 3);
                  },
                  size: size,
                  imageName: 'ic_notification',
                  isSelected: widget.bottomNavigation ==
                      BottomNavigationEnum.NOTIFICATION),
            ]),
          ))
    ]);
  }
}

Widget navItem(
    {required Size size,
    required String imageName,
    required bool isSelected,
    required Function onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          onTap();
        },
        child: SvgPicture.asset(
          'assets/images/$imageName.svg',
          width: isSelected ? screenWidth(16) : screenWidth(20),
          color: AppColors.mainDarkPurple,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 2,
          width: 50,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainPurple : Colors.transparent,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: isSelected ? AppColors.mainPurple : Colors.transparent,
            ),
          ),
        ),
      ),
    ],
  );
}
