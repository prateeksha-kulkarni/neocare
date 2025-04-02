import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.background,
          ),
          child: SafeArea(
            child: Padding(
              padding: styles.AppStyles.screenPadding,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.textDark),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome Back!',
                      style: styles.AppStyles.heading1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please sign in to continue',
                      style: styles.AppStyles.bodyText,
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      label: 'Email Address',
                      controller: _emailController,
                      hintText: 'your@email.com',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email, color: AppColors.textLight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Password',
                      controller: _passwordController,
                      hintText: '••••••••',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock, color: AppColors.textLight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text('Remember me', style: styles.AppStyles.bodyText),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // Navigate to forgot password screen
                          },
                          child: Text(
                            'Forgot Password?',
                            style: styles.AppStyles.bodyText.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: 'Sign In',
                      onPressed: _submitForm,
                      isLoading: _isLoading,
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Or sign in with',
                        style: styles.AppStyles.bodyText.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/google.png', width: 24),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: Image.asset('assets/facebook.png', width: 24),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: styles.AppStyles.bodyText,
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: styles.AppStyles.bodyText.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}