import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withOpacity(0.9),
              AppColors.secondary.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: styles.AppStyles.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Hero(
                  tag: 'app-logo',
                  child: Icon(
                    Icons.child_care,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Welcome to BabyCare',
                  style: styles.AppStyles.heading1.copyWith(
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Track your baby\'s growth, milestones, and daily activities all in one place.',
                  style: styles.AppStyles.bodyText.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
                const Spacer(flex: 3),
                CustomButton(
                  text: 'Get Started',
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'I already have an account',
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  isPrimary: false,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}