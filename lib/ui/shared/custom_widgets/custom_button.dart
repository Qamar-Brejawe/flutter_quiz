import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';
import '../utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? borderColor;
  final Color? backgroundColor;
  final Function? onPressed;
  final String? imageName;
  final double? width;
  final double? hight;
  final double? raduis;
  final OutlinedBorder? outlinedBorder;
  const CustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.borderColor,
    this.backgroundColor,
    this.onPressed,
    this.imageName,
    this.width,
    this.hight,
    this.outlinedBorder,
    this.raduis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageName != null) ...[
              SvgPicture.asset('assets/images/$imageName.svg'),
              SizedBox(
                width: size.width * 0.02,
              )
            ],
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? AppColors.mainWhiteColor,
                  fontSize: textSize ?? size.width * 0.045,
                  fontWeight: textFontWeight ?? FontWeight.bold),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: outlinedBorder ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(raduis ?? screenWidth(60)),
              ),
          backgroundColor: backgroundColor ?? AppColors.mainDarkPurple,
          fixedSize: Size(width ?? screenWidth(1.11), hight ?? screenWidth(8)),
          side: borderColor != null
              ? BorderSide(
                  width: screenWidth(300),
                  color: borderColor ?? AppColors.mainDarkPurple,
                )
              : null,
        ));
  }
}
