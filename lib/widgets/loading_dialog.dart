import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';

void showLoading() {
  showGeneralDialog(
    context: Get.context!,
    barrierDismissible: false,
    transitionBuilder: (context, animation1, animation2, child) {
      double curveVal = Curves.elasticInOut.transform(animation1.value);

      return Transform.scale(
        scale: curveVal,
        child: child,
      );
    },
    pageBuilder: (context, animation1, animation2) {
      return WillPopScope(
        onWillPop: () async {
          return Future.value(false);
        },
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: LoadingAnimationWidget.inkDrop(
                color: Pallette.primary,
                size: 40,
              ),
            ),
          ],
        ),
      );
    },
  );
}
