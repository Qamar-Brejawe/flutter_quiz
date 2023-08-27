import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/core/translations/app_translations.dart';
import 'package:quiz/ui/shared/colors.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_radio.dart';
import 'package:quiz/ui/shared/utils.dart';

class CustomQuestionContainer extends StatefulWidget {
  final Color? borderColor;
  final String? answerText;
  final bool isCorrect;
  final bool isVisibleAnswerResult;
  final int value;
  final Color? fillColor;
  final Function onTaped;
  final int selected;

  CustomQuestionContainer({
    super.key,
    this.borderColor,
    this.answerText,
    required this.isCorrect,
    required this.isVisibleAnswerResult,
    required this.value,
    this.fillColor,
    required this.onTaped,
    required this.selected,

    //this.groupRadio
  });

  @override
  State<CustomQuestionContainer> createState() =>
      _CustomQuestionContainerState();
}

class _CustomQuestionContainerState extends State<CustomQuestionContainer> {
  @override
  Widget build(BuildContext context) {
    List<String> words = widget.answerText!.split(" ").take(5).toList();
    //  List<String> selectedWords = words.take(5).toList();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(300), vertical: screenWidth(80)),
      child: Container(
        constraints: BoxConstraints(
            minHeight: screenWidth(5),
            minWidth: screenWidth(3.5),
            maxWidth: double.infinity,
            maxHeight: double.infinity),
        decoration: BoxDecoration(
          border: Border.all(
              color: widget.isVisibleAnswerResult
                  ? (widget.isCorrect
                      ? AppColors.mainBlueColor
                      : AppColors.mainRedColor)
                  : AppColors.mainBlackColor),
          borderRadius: BorderRadius.circular(screenWidth(50)),
          //shape: BoxShape.rectangle,

          // color: widget.borderColor ?? AppColors.mainBlackColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(45), vertical: screenWidth(50)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomRadio(
                value: widget.value,
                onTaped: widget.onTaped,
                selected: widget.selected,
                fillColor: widget.isVisibleAnswerResult
                    ? (widget.isCorrect
                        ? AppColors.mainBlueColor
                        : AppColors.mainRedColor)
                    : AppColors.mainBlackColor),
            SizedBox(
              width: screenWidth(30),
            ),
            Expanded(
              child: Text(
                widget.answerText!,
                softWrap: true,
                style: TextStyle(
                  color: widget.isVisibleAnswerResult
                      ? (widget.isCorrect
                          ? AppColors.mainBlueColor
                          : AppColors.mainRedColor)
                      : AppColors.mainBlackColor,
                  fontSize: screenWidth(28),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth(50),
            ),
            Visibility(
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: widget.isVisibleAnswerResult,
                child: widget.isCorrect
                    ? SvgPicture.asset(
                        'assets/images/ic_correct.svg',
                        color: AppColors.mainBlueColor,
                      )
                    : SvgPicture.asset(
                        'assets/images/ic_wrong.svg',
                      ))
          ]),
        ),
      ),
    );
  }
}
