import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

class CapsuleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final bool filled;
  final double width;

  const CapsuleButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width = 130,
    this.color = Pallette.capsuleSecondary,
    this.textColor = Pallette.capsuleTextSecondary,
  })  : filled = false,
        super(key: key);

  const CapsuleButton.filled({
    Key? key,
    required this.label,
    required this.onTap,
    this.width = 130,
    this.color = Pallette.capsuleSecondary,
    this.textColor = Pallette.capsuleTextSecondary,
  })  : filled = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      minWidth: width,
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
