import 'package:flutter/material.dart';

class CreateBlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post Screen'),
        backgroundColor: Colors.blue, // Replace with your theme color
      ),
      body: Center(
        child: Text('Create a new post here'),
      ),
    );
  }
}
