import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;
import '../services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept terms and conditions')),
      );
      return;
    }
    setState(() => _isLoading = true);

    try {
      await AuthService().signup(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Show success prompt
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('User Created Successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, '/dashboard'); // Redirect
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: styles.AppStyles.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.textDark),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 24),
                Text('Create Account', style: styles.AppStyles.heading1),
                const SizedBox(height: 8),
                Text('Fill in your details to get started',
                    style: styles.AppStyles.bodyText),
                const SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Full Name',
                        controller: _nameController,
                        hintText: 'John Doe',
                        prefixIcon: Icon(Icons.person, color: AppColors.textLight),
                        validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Email Address',
                        controller: _emailController,
                        hintText: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(Icons.email, color: AppColors.textLight),
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter your email';
                          if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
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
                          if (value!.isEmpty) return 'Please enter your password';
                          if (value.length < 6) return 'Password must be at least 6 characters';
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Confirm Password',
                        controller: _confirmPasswordController,
                        hintText: '••••••••',
                        obscureText: true,
                        prefixIcon: Icon(Icons.lock_outline, color: AppColors.textLight),
                        validator: (value) {
                          if (value!.isEmpty) return 'Please confirm your password';
                          if (value != _passwordController.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) => setState(() => _acceptTerms = value!),
                      activeColor: AppColors.primary,
                    ),
                    Expanded(
                      child: Text(
                        'I agree to the Terms and Privacy Policy',
                        style: styles.AppStyles.bodyText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Create Account',
                  onPressed: _submitForm,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      'Already have an account? Sign In',
                      style: styles.AppStyles.bodyText.copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
