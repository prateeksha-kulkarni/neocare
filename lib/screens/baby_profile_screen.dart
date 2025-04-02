import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart' as styles;

class BabyProfileScreen extends StatefulWidget {
  const BabyProfileScreen({Key? key}) : super(key: key);

  @override
  State<BabyProfileScreen> createState() => _BabyProfileScreenState();
}

class _BabyProfileScreenState extends State<BabyProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  DateTime? _selectedDate;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthDateController.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
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
                      'Add Your Baby',
                      style: styles.AppStyles.heading1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tell us about your little one',
                      style: styles.AppStyles.bodyText,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary.withOpacity(0.1),
                            ),
                            child: Icon(
                              Icons.child_care,
                              size: 60,
                              color: AppColors.primary,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: styles.AppStyles.cardShadow,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      label: 'Baby Name',
                      controller: _nameController,
                      hintText: 'Enter baby\'s name',
                      prefixIcon: Icon(Icons.baby_changing_station, color: AppColors.textLight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter baby\'s name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Birth Date',
                      controller: _birthDateController,
                      hintText: 'Select birth date',
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      prefixIcon: Icon(Icons.calendar_today, color: AppColors.textLight),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select birth date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Birth Weight (kg)',
                            controller: _weightController,
                            hintText: '3.5',
                            keyboardType: TextInputType.number,
                            prefixIcon: Icon(Icons.monitor_weight, color: AppColors.textLight),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            label: 'Birth Height (cm)',
                            controller: _heightController,
                            hintText: '50',
                            keyboardType: TextInputType.number,
                            prefixIcon: Icon(Icons.height, color: AppColors.textLight),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter height';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'Save Profile',
                      onPressed: _submitForm,
                      isLoading: _isLoading,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        },
                        child: Text(
                          'Skip for now',
                          style: styles.AppStyles.bodyText.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
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