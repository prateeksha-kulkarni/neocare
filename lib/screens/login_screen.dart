import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;
import '../services/auth_service.dart';  // Import AuthService


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
            color: Colors.white,
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
                      style: styles.AppStyles.heading1.copyWith(color: AppColors.header),
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

                    const SizedBox(height: 30),
                    CustomButton(
                      text: _isLoading ? 'Signing In...' : 'Sign In',
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        setState(() => _isLoading = true);

                        try {
                          // Call the authentication service
                          User? user = await AuthService().signin(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          // If authentication is successful (user is not null), navigate to dashboard
                          if (user != null) {
                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid email or password')),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }

                        setState(() => _isLoading = false);
                      },
                      isLoading: _isLoading,
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