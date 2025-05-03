import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF625BFF), // Replace with AppColors.primary if needed
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Text(
                  'Welcome to',
                  style: styles.AppStyles.bodyText.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Text(
                //   'ShishuCare',
                //   style: styles.AppStyles.heading1.copyWith(
                //     fontSize: 32,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 36),
                Hero(
                  tag: 'app-logo',
                  child: Image.asset(
                    'lib/assets/images/baby_logo1.png', // Replace with your actual asset path
                    height: 150,
                  ),
                ),
                const SizedBox(height: 48),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  isPrimary: false,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Login',
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  isPrimary: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
