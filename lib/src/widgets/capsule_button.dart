import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

class CapsuleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final bool filled;
  final double? width;

  const CapsuleButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.color = Pallette.capsuleSecondary,
    this.textColor = Pallette.capsuleTextSecondary,
  })  : filled = false,
        super(key: key);

  const CapsuleButton.filled({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.color = Pallette.capsuleSecondary,
    this.textColor = Pallette.capsuleTextSecondary,
  })  : filled = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5.w),
      minWidth: width ?? 130.w,
      height: 0,
      onPressed: onTap,
      color: filled ? color : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: filled ? BorderSide.none : BorderSide(color: color),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
