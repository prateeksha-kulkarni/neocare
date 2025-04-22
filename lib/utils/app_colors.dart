import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

import 'package:flutter/material.dart';

class AppColors {
  // Bright & Playful BabyCare Color Scheme
  static const Color primary = Color(0xFF8A9EFF);      // Periwinkle Blue
  static const Color secondary = Color(0xFFFFB6C1);     // Light Pink (like #FFD6E7)
  static const Color accent = Color(0xFF7FDBFF);        // Sky Blue (accent)
  static const Color background = Color(0xFFFEF9FF);    // Near-white Lavender
  static const Color surface = Color(0xFFFFFFFF);       // Pure White
  static const Color textDark = Color(0xFF3A3B3C);      // Dark Gray
  static const Color textLight = Color(0xFFA5A5A5);     // Soft Gray
  static const Color error = Color(0xFFFF6B6B);         // Coral Red
  static const Color success = Color(0xFF77DD77);       // Mint Green
  static const Color milestone = Color(0xFFFFD166);     // Warm Yellow (for milestones)
}


// lib/utils/app_styles.dart


class AppStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}