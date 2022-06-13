import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';

class DotIndicator extends StatelessWidget {
  final bool selected;

  const DotIndicator({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: selected ? 10 : 8,
      width: selected ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Pallette.primary : Colors.grey,
      ),
    );
  }
}
