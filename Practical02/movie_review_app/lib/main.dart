import 'package:flutter/material.dart';
import 'screens/feedback_form.dart'; // Import the feedback form screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Feedback App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FeedbackForm(), // Set FeedbackForm as the starting screen
    );
  }
}
