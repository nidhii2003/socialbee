import 'package:flutter/material.dart';
import '../app_colors.dart'; // Import AppColors if needed
import 'login_screen.dart'; // Import Login screen

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneRegex = RegExp(r"^\+91\d{10}$"); // Regex for validating phone number (India)

    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pop screen on back press
          },
          color: AppColors.accentColor,
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Your Phone Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'We have sent a verification code to your phone number. Please check your messages and enter the code below.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // A TextField for entering the phone number
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number (+91xxxxxxxxxx)',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Verify Button
            GestureDetector(
              onTap: () {
                // Validate phone number format using the regex
                if (phoneRegex.hasMatch(phoneController.text)) {
                  // Handle phone verification logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Phone Verified!')),
                  );

                  // Navigate to the Login Screen after successful verification
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );

                  // Optionally pop the screen if you want to return to the previous screen
                  // Navigator.pop(context);
                } else {
                  // Show error dialog if the phone number doesn't match the regex
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Invalid Phone Number'),
                        content: const Text('Please enter a valid phone number in the format +91xxxxxxxxxx'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor,
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'VERIFY PHONE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
