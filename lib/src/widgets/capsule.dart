import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

class Capsule extends StatelessWidget {
  final String label;
  final bool primary;
  final bool mini;
  final bool withConstraints;
  final Color? color;

  const Capsule({
    Key? key,
    required this.label,
    this.primary = false,
    this.mini = false,
    this.withConstraints = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      constraints: withConstraints
          ? BoxConstraints(minWidth: mini ? Metrics.capsuleMinWidth : 100)
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: color ??
              (primary ? Pallette.capsulePrimary : Pallette.capsuleSecondary),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: mini
            ? Theme.of(context).textTheme.caption!.copyWith(
                  color: color ??
                      (primary
                          ? Pallette.capsuleTextPrimary
                          : Pallette.capsuleTextSecondary),
                )
            : TextStyle(
                color: color ??
                    (primary
                        ? Pallette.capsuleTextPrimary
                        : Pallette.capsuleTextSecondary),
              ),
      ),
    );
  }
}
