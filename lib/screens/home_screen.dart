import 'package:flutter/material.dart';
import 'package:socialbee/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Center(
        child: Text(
          'My Home Screen after successful login!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor, // Using primary color from app_colors.dart
          ),
        ),
      ),
    );
  }
}
