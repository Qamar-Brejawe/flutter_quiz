import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/ui/views/splash_screen_view/splash_screen_controller.dart';

import '../../shared/colors.dart';
import '../../shared/utils.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            //  backgroundColor:
            // AppColors.mainBackGroundSplashColor.withOpacity(0.9),
            body: Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Lottie.asset('assets/lottie/3.json'),
        ),
      ],
    )));
  }
}
