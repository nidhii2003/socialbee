import 'dart:math';
import 'package:flutter/material.dart';
import 'package:socialbee/screens/home_screen.dart';

// Assuming HomeScreen is already imported in your project
// import 'home_screen.dart'; // Uncomment this and adjust the import path as necessary.

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();
  String generatedCode = '';
  bool isCodeSent = false;

  // Generate a random 6-digit verification code
  String generateVerificationCode() {
    Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  // Simulate sending verification email
  void sendVerificationEmail(String email) {
    // Here we simulate the sending of an email by generating a code
    setState(() {
      generatedCode = generateVerificationCode();
      isCodeSent = true;
    });
    // For now, just show a SnackBar instead of actually sending an email
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code sent! Please check your email.')),
    );

    // Print the generated code to the console for debugging
    print('Generated Verification Code: $generatedCode');
  }

  // Verify the entered code
  void verifyCode() {
    if (verificationCodeController.text == generatedCode) {
      // Code is correct
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email Verified!')),
      );

      // Navigate to the HomeScreen after successful verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),  // Replace 'HomeScreen' with your actual HomeScreen widget
      );
    } else {
      // Incorrect code
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('The verification code is incorrect. Please try again.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Your Email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'We will send a verification code to your email. Please check your inbox.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // TextField for email input
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.blue),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button to simulate sending verification email
            GestureDetector(
              onTap: () {
                sendVerificationEmail(emailController.text);
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'SEND VERIFICATION EMAIL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (isCodeSent) ...[
              const SizedBox(height: 20),
              const Text(
                'Enter the verification code sent to your email:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              // TextField for entering verification code
              TextFormField(
                controller: verificationCodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Verification Code',
                  labelStyle: TextStyle(color: Colors.blue),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Button to verify the code
              GestureDetector(
                onTap: () {
                  verifyCode();
                },
                child: Container(
                  height: 55,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.lightBlueAccent,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'VERIFY CODE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Display the generated verification code for debugging
              Text(
                'Generated Code: $generatedCode',  // Displaying the code for testing
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
