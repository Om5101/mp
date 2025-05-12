import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/user.jpg"), // Add user photo in assets folder
          ),
          SizedBox(height: 10),
          Text(
            "Om Shinde", // Updated name
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "omshinde15@gmail.com", // Updated email
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.blue),
            title: Text("9172293490"), // Updated phone number
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text("Pune, Maharashtra, India"), // Updated address section
          ),
          SizedBox(height: 20),
          Divider(),
          Text(
            "Interests",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.code, color: Colors.green),
            title: Text("Software Development"),
          ),
          ListTile(
            leading: Icon(Icons.trending_up, color: Colors.orange),
            title: Text("Stock Market & Finance"),
          ),
          ListTile(
            leading: Icon(Icons.palette, color: Colors.purple),
            title: Text("Graphic Designing"),
          ),
          ListTile(
            leading: Icon(Icons.explore, color: Colors.blue),
            title: Text("Adventure & Trekking"),
          ),
        ],
      ),
    );
  }
}