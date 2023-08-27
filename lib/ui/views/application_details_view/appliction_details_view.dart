import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/ui/shared/custom_widgets/custom_widget.dart';

import 'appliction_details_controller.dart';

class ApplicationDetailsView extends StatelessWidget {
  const ApplicationDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    ApplicationDetailsController controller =
        Get.put(ApplicationDetailsController());

    return CustomWidget(text: "عن التطبيق", body: Text(""));
  }
}
