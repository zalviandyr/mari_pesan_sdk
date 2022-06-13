import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

class TopDivider extends StatelessWidget {
  const TopDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 5,
        width: 150,
        decoration: BoxDecoration(
          color: Pallette.primary,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
