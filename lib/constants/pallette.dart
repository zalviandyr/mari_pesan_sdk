import 'package:flutter/material.dart';

class Pallette {
  static const Color primary = Color(0xFFE74C3C);
  static MaterialColor primarySwatch = MaterialColor(
    Pallette.primary.value,
    {
      50: Pallette.primary.withOpacity(.1),
      100: Pallette.primary.withOpacity(.2),
      200: Pallette.primary.withOpacity(.3),
      300: Pallette.primary.withOpacity(.4),
      400: Pallette.primary.withOpacity(.5),
      500: Pallette.primary.withOpacity(.6),
      600: Pallette.primary.withOpacity(.7),
      700: Pallette.primary.withOpacity(.8),
      800: Pallette.primary.withOpacity(.9),
      900: Pallette.primary.withOpacity(1),
    },
  );
  static const Color secondary = Color(0xFF4CAF50);
  static const Color ternary = Color(0xFF1976D2);
  static const Color outline = Color(0xFF9E9E9E);

  static const Color textPrimary = Color(0xFF474747);
  static Color textSecondary = Colors.grey.shade700;

  static const Color capsulePrimary = Pallette.primary;
  static const Color capsuleTextPrimary = Color(0xFFFF3D00);
  static const Color capsuleSecondary = Color(0xFFC4C4C4);
  static const Color capsuleTextSecondary = Pallette.outline;

  static const Color iconPrimary = Pallette.primary;
  static const Color iconSecondary = Pallette.textPrimary;

  static const Color buttonPrimary = Pallette.primary;
  static const Color buttonSecondary = Pallette.secondary;
  static const Color buttonTernary = Pallette.capsuleTextSecondary;

  static Color formInput = Colors.grey.shade300;
  static const Color formOutline = Pallette.capsuleTextSecondary;

  static Color shimmerBase = Colors.grey.shade200;
  static Color shimmerHighlight = Colors.grey.shade100;
}
