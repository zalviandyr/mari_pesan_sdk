import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';

void showSnackbar(String message, {bool isError = false}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: isError ? Colors.red : Pallette.secondary,
    ),
  );
}
