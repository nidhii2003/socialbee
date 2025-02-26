import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        backgroundColor: Colors.blue, // Replace with your theme color
      ),
      body: Center(
        child: Text('Chat screen content goes here'),
      ),
    );
  }
}
