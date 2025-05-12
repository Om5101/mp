import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String age;
  final String event;
  final String feedback;
  final double rating;
  final String gender;

  ConfirmationScreen({
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.event,
    required this.feedback,
    required this.rating,
    required this.gender,
  });

  String getEmoji() {
    if (rating == 5) return '';
    if (rating == 4) return '';
    if (rating == 3) return '';
    if (rating == 2) return '';
    return '🤩'; // For rating 5 (excited face)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView( // ✅ FIXED OVERFLOW ISSUE
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // ✅ Aligned left
            children: [
              Text(
                "Thank You for Your Feedback! ${getEmoji()}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "We appreciate your time in helping us improve.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Divider(),
              buildInfoRow("👤 Name:", name),
              buildInfoRow("📧 Email:", email),
              buildInfoRow("📞 Phone:", phone),
              buildInfoRow("🎂 Age:", age),
              buildInfoRow("🚻 Gender:", gender),
              buildInfoRow("🎬 Movie:", event),
              buildInfoRow("💬 Feedback:", feedback),
              buildInfoRow("⭐ Rating:", "${rating.toString()} ${getEmoji()}"),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Back"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(width: 5),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
