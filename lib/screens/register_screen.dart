import 'package:flutter/material.dart';
import 'package:socialbee/screens/verify_email.dart';
import 'package:socialbee/screens/phone_verification.dart'; // Import phone verification screen

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Function to validate phone number with "+91" followed by 10 digits
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number or email';
    }
    final phoneRegex = RegExp(r"^\+91\d{10}$");
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@(ves\.ac\.in|gmail\.com)$");

    // If input starts with +91 and has exactly 10 digits
    if (phoneRegex.hasMatch(value)) {
      return null;
    }

    // If input matches the email pattern
    if (emailRegex.hasMatch(value)) {
      return null;
    }

    return 'Please enter a valid phone number or a valid email address';
  }

  // Function to validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Function to validate confirm password
  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Function to validate name
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Input'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFA53860),
                  Color(0xff281537),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Name input field with validation
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA53860),
                          ),
                          suffixIcon: const Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                        ),
                        validator: _validateName,
                      ),
                      const SizedBox(height: 10),

                      // Phone or Email input field with validation
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Phone or Gmail',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA53860),
                          ),
                          suffixIcon: const Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 10),

                      // Password input field with visibility toggle and validation
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA53860),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 10),

                      // Confirm Password input field with visibility toggle and validation
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFA53860),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: _validateConfirmPassword,
                      ),
                      const SizedBox(height: 10),

                      const SizedBox(height: 70),

                      // Sign Up button
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Form is valid, check if phone or email is entered
                            String enteredValue = _emailController.text.trim();

                            // If phone number is entered, go to phone verification
                            if (RegExp(r"^\+91\d{10}$").hasMatch(enteredValue)) {
                              // Navigate to phone verification screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerifyPhoneScreen(),
                                ),
                              );
                            }
                            // If email is entered, go to email verification
                            else if (RegExp(r"^[a-zA-Z0-9._%+-]+@(ves\.ac\.in|gmail\.com)$")
                                .hasMatch(enteredValue)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VerifyEmailScreen(),
                                ),
                              );
                            } else {
                              _showErrorDialog('Invalid phone number or email!');
                            }
                          } else {
                            // If the form is not valid, show error dialog
                            _showErrorDialog('Wrong User Inputs! Try Again!');
                          }
                        },
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFA53860),
                                Color(0xff281537),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),

                      // Sign In redirect text
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
