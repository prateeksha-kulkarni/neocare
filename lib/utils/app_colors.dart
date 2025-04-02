import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

import 'package:flutter/material.dart';

class AppColors {
  // Soft pastel color scheme
  static const Color primary = Color(0xFF8BD3DD);  // Soft teal
  static const Color secondary = Color(0xFFF5A3B7); // Blush pink
  static const Color accent = Color(0xFFFFD166);   // Warm yellow
  static const Color background = Color(0xFFFEF6F6); // Very light pink
  static const Color surface = Color(0xFFFFFFFF);   // Pure white
  static const Color textDark = Color(0xFF2B2D42);  // Dark blue-gray
  static const Color textLight = Color(0xFF8D99AE); // Light gray-blue
  static const Color error = Color(0xFFEF476F);     // Vibrant pink-red
  static const Color success = Color(0xFF06D6A0);   // Mint green
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