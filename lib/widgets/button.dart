import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mari_pesan_sdk/constants/constants.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final Color color;
  final bool outlined;
  final bool loading;
  final String? label;
  final Widget? child;
  final IconData? icon;
  final MainAxisAlignment _mainAxisAlignment;

  const Button({
    Key? key,
    required this.onPressed,
    this.height = 40,
    this.color = Pallette.buttonPrimary,
    this.outlined = false,
    this.loading = false,
    this.label,
    this.child,
  })  : icon = null,
        _mainAxisAlignment = MainAxisAlignment.center,
        super(key: key);

  const Button.icon(
    this.icon, {
    Key? key,
    required this.onPressed,
    this.color = Pallette.buttonPrimary,
    this.loading = false,
    this.label,
  })  : _mainAxisAlignment = MainAxisAlignment.start,
        height = 40,
        child = null,
        outlined = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: loading ? () {} : onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: outlined
            ? const BorderSide(color: Pallette.outline, width: 1)
            : BorderSide.none,
      ),
      color: outlined ? Colors.white : color,
      height: height,
      minWidth: double.infinity,
      child: loading
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 30,
            )
          : child ??
              Row(
                mainAxisAlignment: _mainAxisAlignment,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                  ],
                  Text(
                    label ?? '',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: outlined ? Colors.black : Colors.white),
                  ),
                ],
              ),
    );
  }
}
