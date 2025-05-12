import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  final List<Map<String, String>> companies = [
    {"name": "Google", "industry": "IT & Software", "ctc": "45 LPA", "cgpa": "8.5+", "location": "Bangalore, Hyderabad"},
    {"name": "Microsoft", "industry": "IT & Software", "ctc": "40 LPA", "cgpa": "8.0+", "location": "Hyderabad, Bangalore"},
    {"name": "Amazon", "industry": "E-commerce & Cloud", "ctc": "35 LPA", "cgpa": "7.5+", "location": "Bangalore, Hyderabad"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Details", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: companies.length,
          itemBuilder: (context, index) {
            final company = companies[index];
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company["name"]!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    ),
                    SizedBox(height: 8),
                    Text("Industry: ${company["industry"]}", style: TextStyle(fontSize: 16, color: Colors.black87)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Text("CTC: ${company["ctc"]}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.school, color: Colors.blueAccent),
                        SizedBox(width: 5),
                        Text("Eligibility: ${company["cgpa"]} CGPA", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.redAccent),
                        SizedBox(width: 5),
                        Text("Location: ${company["location"]}", style: TextStyle(fontSize: 16, color: Colors.black87)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Applied to ${company["name"]}!")),
                          );
                        },
                        child: Text("Apply", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Roboto',
    ),
    home: CompanyDetails(),
  ));
}
