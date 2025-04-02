import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Text styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
    letterSpacing: -0.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textLight,
    height: 1.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  // Spacing and layout
  static const EdgeInsets screenPadding = EdgeInsets.all(24.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: 16,
    horizontal: 24,
  );

  // Visual effects
  static const double borderRadius = 16.0;
  static const double cardElevation = 2.0;
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    )
  ];

  // Animation durations
  static const Duration quickDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 350);
}
