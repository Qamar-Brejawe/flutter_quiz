import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quiz/main.dart';
import 'package:quiz/ui/views/courses_view/courses_view.dart';
import 'package:quiz/ui/views/login_view/login_view.dart';
import 'package:quiz/ui/views/main_view/home_view/home_view.dart';
import 'package:quiz/ui/views/main_view/main_view.dart';
import 'package:quiz/ui/views/main_view/profile_view/profile_view.dart';
import 'package:quiz/ui/views/main_view/important_question_view/important_question_view.dart';
import 'package:quiz/ui/views/signup_view/signup_view.dart';

import '../core/enums/connectivityStatus.dart';
import '../core/translations/app_translations.dart';
import '../core/utils/general_util.dart';
import '../ui/shared/colors.dart';
import '../ui/views/course_options_view/course_options_view.dart';
import '../ui/views/edit-profile_view/edit_profile._view.dart';
import '../ui/views/overlay_register_view/overlay_register_view.dart';
import '../ui/views/questions_view/question_view_shimmer.dart';
import '../ui/views/questions_view/questions_view.dart';
import '../ui/views/result_view/result_view.dart';
import '../ui/views/splash_screen_view/splash_screen_view.dart';
import '../ui/views/years_courses_view/years_courses_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp , DeviceOrientation.landscapeLeft , DeviceOrientation.landscapeLeft],
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );

    return StreamProvider(
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        initialData: ConnectivityStatus.ONLINE,
        child: GetMaterialApp(
          defaultTransition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 300),
          translations: AppTranslation(),
          locale: getLocal(),
          fallbackLocale: getLocal(),
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Alexandria",
            //  primarySwatch: Colors.deepOrange,
            textTheme: TextTheme(),
          ),
          home: QuestionWidget(),
        ));
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}
