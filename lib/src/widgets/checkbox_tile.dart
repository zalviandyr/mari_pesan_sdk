import 'package:flutter/material.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';

class CheckboxTile extends StatelessWidget {
  final String label;
  final bool value;
  final VoidCallback onChanged;

  const CheckboxTile({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: [
          Checkbox(
            value: value,
            shape: const CircleBorder(),
            checkColor: Colors.transparent,
            activeColor: Pallette.primary,
            onChanged: (_) => onChanged(),
          ),
          Text(label),
        ],
      ),
    );
  }
}
