import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../utils.dart';

class CustomWidget extends StatefulWidget {
  final String text;
  final String? imageName;
  final Widget? bottomNavigationBar;
  final Widget body;
  final bool? visiblShapeMaker;
  const CustomWidget(
      {super.key,
      required this.text,
      this.bottomNavigationBar,
      required this.body,
      this.visiblShapeMaker,
      this.imageName});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: widget.bottomNavigationBar,
            body: Stack(children: [
              Builder(builder: (context) {
                return Container(child: widget.body);
              }),
              Visibility(
                visible: widget.visiblShapeMaker ?? true,
                child: Stack(children: [
                  //  widget.body,
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: screenWidth(4.3),
                      child: ClipPath(
                        clipper: ShapegClipper(),
                        child: Container(
                            width: screenWidth(1),
                            height: screenWidth(3),
                            alignment: Alignment.bottomCenter,
                            decoration:
                                BoxDecoration(color: AppColors.mainDarkPurple)),
                      )),
                  Positioned(
                      top: 30,
                      right: 20,
                      child: Row(children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(
                            'assets/images/${widget.imageName ?? "ic_back"}.svg',
                            color: AppColors.mainWhiteColor,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(30),
                        ),
                        // Obx(() { return
                        Text(
                          widget.text,
                          style: TextStyle(
                              color: AppColors.mainWhiteColor,
                              fontSize: screenWidth(27)),
                        ),
                      ])),
                ]),
              ),
            ])));
  }
}

@override
class ShapegClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9956692);
    path_0.cubicTo(
        size.width * 0.1023160,
        size.height * 0.6877908,
        size.width * 0.3315976,
        size.height * 0.7502392,
        size.width * 0.4827741,
        size.height * 0.7914154);
    path_0.cubicTo(
        size.width * 0.4872235,
        size.height * 0.7926231,
        size.width * 0.4916071,
        size.height * 0.7938231,
        size.width * 0.4959153,
        size.height * 0.7949846);
    path_0.cubicTo(
        size.width * 0.5370965,
        size.height * 0.8061231,
        size.width * 0.5762376,
        size.height * 0.8183692,
        size.width * 0.6133012,
        size.height * 0.8299692);
    path_0.cubicTo(
        size.width * 0.7922471,
        size.height * 0.8859615,
        size.width * 0.9227176,
        size.height * 0.9267923,
        size.width,
        size.height * 0.7537508);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.9956692);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
