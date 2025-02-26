import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        backgroundColor: Colors.blue, // Replace with your theme color
      ),
      body: Center(
        child: Text('Profile details go here'),
      ),
    );
  }
}
