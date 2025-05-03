import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isLoading;
  final bool isFullWidth;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isLoading = false,
    this.isFullWidth = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : AppColors.surface,
          foregroundColor: isPrimary ? Colors.white : AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12), // ↓ padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // ↑ border radius
            side: BorderSide(
              color: isPrimary ? Colors.transparent : AppColors.primary,
              width: 1.5,
            ),
          ),
          elevation: isPrimary ? styles.AppStyles.cardElevation : 0,
          shadowColor: AppColors.primary.withOpacity(0.2),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : Text(
          text,
          style: styles.AppStyles.buttonText.copyWith(
            color: isPrimary ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
