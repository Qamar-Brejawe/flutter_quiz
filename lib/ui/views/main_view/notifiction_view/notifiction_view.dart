import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login_view/login_controller.dart';
import 'notifiction_controller.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationController controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
          children: [Text("NotificationView", style: TextStyle(fontSize: 30))]),
    ));
  }
}
