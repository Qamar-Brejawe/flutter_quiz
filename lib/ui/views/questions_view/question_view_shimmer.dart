import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/coustom_question_container.dart';
import '../../shared/custom_widgets/custom_radio.dart';
import '../../shared/utils.dart';

class QuestionViewShimmer extends StatefulWidget {
  const QuestionViewShimmer({super.key});

  @override
  State<QuestionViewShimmer> createState() => _QuestionViewShimmerState();
}

class _QuestionViewShimmerState extends State<QuestionViewShimmer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Shimmer(
      child: Column(
        children: [
          Text(
            "25. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :",
            softWrap: true,
            style: TextStyle(fontSize: screenWidth(27)),
          ),
          SizedBox(
            height: screenWidth(30),
          ),
          Container(
            height: screenWidth(0.87),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CustomQuestionContainer(
                    answerText:
                        " بروتوكول الانترنت لا يقدم اليات تحكم بالتدفق او التحكم بالاأخطاء",
                    isVisibleAnswerResult: false,
                    isCorrect: false,
                    onTaped: () {},
                    value: 1,
                    selected: 1,
                  );
                }),
          ),
        ],
      ),
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 236, 233, 233),
          Color.fromARGB(255, 74, 77, 78)
        ],
      ),
    )));
  }
}
