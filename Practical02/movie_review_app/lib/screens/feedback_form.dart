import 'package:flutter/material.dart';
import 'confirmation.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  double _rating = 0;
  String? _event;
  String? _gender;

  final List<String> _events = ['Inception', 'The Dark Knight', 'Avengers', 'Titanic'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_rating > 0 && _event != null && _gender != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConfirmationScreen(
              name: _nameController.text,
              email: _emailController.text,
              phone: _phoneController.text,
              age: _ageController.text,
              event: _event!,
              feedback: _feedbackController.text,
              rating: _rating,
              gender: _gender!,
            ),
          ),
        );
      } else {
        String message = _rating == 0
            ? 'Please provide a rating.'
            : _event == null
            ? 'Please select a movie.'
            : 'Please select your gender.';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Feedback Form'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Please enter your age' : null,
                ),
                SizedBox(height: 10),
                Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                RadioListTile<String>(
                  title: Text("Male"),
                  value: "Male",
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value),
                ),
                RadioListTile<String>(
                  title: Text("Female"),
                  value: "Female",
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value),
                ),
                DropdownButtonFormField<String>(
                  value: _event,
                  decoration: InputDecoration(labelText: 'Select Movie'),
                  items: _events.map((event) {
                    return DropdownMenuItem<String>(
                      value: event,
                      child: Text(event),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _event = value),
                ),
                TextFormField(
                  controller: _feedbackController,
                  decoration: InputDecoration(labelText: 'Feedback'),
                  validator: (value) => value!.isEmpty ? 'Please provide your feedback' : null,
                ),
                SizedBox(height: 10),
                Text("Rate your experience:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Text('😊', style: TextStyle(fontSize: 30)), onPressed: () => setState(() => _rating = 5)),
                    IconButton(icon: Text('😐', style: TextStyle(fontSize: 30)), onPressed: () => setState(() => _rating = 4)),
                    IconButton(icon: Text('😞', style: TextStyle(fontSize: 30)), onPressed: () => setState(() => _rating = 3)),
                    IconButton(icon: Text('😔', style: TextStyle(fontSize: 30)), onPressed: () => setState(() => _rating = 2)),
                    IconButton(icon: Text('😡', style: TextStyle(fontSize: 30)), onPressed: () => setState(() => _rating = 1)),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
