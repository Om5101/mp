import 'package:flutter/material.dart';

class RaiseTicket extends StatefulWidget {
  @override
  _RaiseTicketState createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> {
  final _formKey = GlobalKey<FormState>();
  String _queryType = 'General Inquiry';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Raise Ticket")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Query Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField(
                value: _queryType,
                items: [
                  'General Inquiry',
                  'Placement Drive Issue',
                  'Company Details Request',
                  'Technical Issue',
                  'Other'
                ].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                onChanged: (value) {
                  setState(() {
                    _queryType = value as String;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text("Describe your issue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your query details here...",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ticket Raised Successfully")));
                    }
                  },
                  child: Text("Submit Ticket"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
