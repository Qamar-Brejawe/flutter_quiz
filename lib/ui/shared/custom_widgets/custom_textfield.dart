import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/ui/shared/utils.dart';
import '../colors.dart';

class CustomTextField extends StatelessWidget {
  final String hitText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? icon;
  final Function(String)? oncahnged;
  final String? imageNamePrefix;
  final Color? imagePrefixColor;
  final Color? imagesufixColor;
  final String? imageNamesufix;
  final Color? fillColor;
  final Color? hintColor;
  final double? width;
  final double? height;
  final double? start;
  final double? end;
  final double? bottom;
  final bool? visibleImageSufixIcon;
  final bool? visibleImagePrefixIcon;
  final int? maxline;
  final int? maxlength;
  final double? hintSize;

  const CustomTextField(
      {Key? key,
      required this.hitText,
      required this.controller,
      this.validator,
      this.icon,
      this.oncahnged,
      this.imageNamePrefix,
      this.fillColor,
      this.hintColor,
      this.width,
      this.height,
      this.start,
      this.end,
      this.visibleImageSufixIcon,
      this.visibleImagePrefixIcon,
      this.maxline,
      this.maxlength,
      this.bottom,
      this.imageNamesufix,
      this.hintSize,
      this.imagePrefixColor,
      this.imagesufixColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            start: start ?? 21, end: end ?? 21, bottom: bottom ?? 20),
        child: SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            textDirection: TextDirection.rtl,
            scrollPhysics: ScrollPhysics(),
            maxLength: maxlength,
            onChanged: oncahnged,
            validator: validator,
            controller: controller,
            textAlign: TextAlign.right,
            textAlignVertical: TextAlignVertical.bottom,
            cursorColor: AppColors.mainDarkPurple,
            maxLines: maxline ?? 1,
            decoration: InputDecoration(
                prefixIcon: visibleImagePrefixIcon ?? false
                    ? UnconstrainedBox(
                        child: SvgPicture.asset(
                          'assets/images/$imageNamePrefix.svg',
                          color: imagePrefixColor ?? AppColors.mainDarkPurple,
                        ),
                      )
                    : null,
                suffixIcon: visibleImageSufixIcon ?? false
                    ? UnconstrainedBox(
                        child: SvgPicture.asset(
                          'assets/images/$imageNamesufix.svg',
                          color: imagesufixColor ?? AppColors.mainDarkPurple,
                        ),
                      )
                    : null,
                hoverColor: AppColors.mainDarkPurple,
                focusColor: AppColors.mainDarkPurple,
                hintText: hitText,
                hintStyle: TextStyle(
                    color:
                        hintColor ?? AppColors.mainLightPurple.withOpacity(0.6),
                    fontSize: hintSize ?? screenWidth(20)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.mainLightBlueColor.withOpacity(0.18),
                    width: 1,
                  ),
                ),
                contentPadding: EdgeInsets.only(
                    bottom: screenWidth(20), right: screenWidth(30)),
                filled: true,
                fillColor:
                    fillColor ?? AppColors.mainLightBlueColor.withOpacity(0.18),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            // validator: (value) => validator != null ? validator!(value!) : null,
          ),
        ));
  }
}
