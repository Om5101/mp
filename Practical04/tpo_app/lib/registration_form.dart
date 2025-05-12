import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController hscTotalController = TextEditingController();
  final TextEditingController hscOutOfController = TextEditingController();
  final TextEditingController sscTotalController = TextEditingController();
  final TextEditingController sscOutOfController = TextEditingController();
  final List<TextEditingController> semesterControllers = List.generate(7, (_) => TextEditingController());

  String? resumePath;
  double hscPercentage = 0.0;
  double sscPercentage = 0.0;
  double cgpa = 0.0;

  @override
  bool get wantKeepAlive => true;

  void calculatePercentage() {
    setState(() {
      hscPercentage = _calculate(hscTotalController.text, hscOutOfController.text);
      sscPercentage = _calculate(sscTotalController.text, sscOutOfController.text);
    });
  }

  void calculateCGPA() {
    setState(() {
      List<double> grades = semesterControllers.map((c) => _parseCGPA(c.text)).toList();
      grades.removeWhere((g) => g == 0.0);
      cgpa = grades.isNotEmpty ? grades.reduce((a, b) => a + b) / grades.length : 0.0;
    });
  }

  double _calculate(String total, String outOf) {
    if (total.isEmpty || outOf.isEmpty) return 0.0;
    double t = double.tryParse(total) ?? 0.0;
    double o = double.tryParse(outOf) ?? 0.0;
    return (o > 0) ? (t / o) * 100 : 0.0;
  }

  double _parseCGPA(String text) {
    return double.tryParse(text) ?? 0.0;
  }

  void pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.path != null) {
      setState(() {
        resumePath = result.files.single.path;
      });
    }
  }

  void viewResume() {
    if (resumePath != null) {
      OpenFile.open(resumePath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No resume selected')));
    }
  }

  Widget buildTextField({required String label, required TextEditingController controller, TextInputType type = TextInputType.text, IconData? icon, Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.black87) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black87),
        ),
        style: TextStyle(color: Colors.black87),
        validator: (value) => value!.isEmpty ? 'Required' : null,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Color(0x210B2C),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFC5CAE9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(label: "Full Name", controller: nameController, icon: Icons.person),
                      buildTextField(label: "Roll Number", controller: rollNoController, icon: Icons.numbers),
                      buildTextField(label: "Course", controller: courseController, icon: Icons.school),
                      buildTextField(label: "Email", controller: emailController, type: TextInputType.emailAddress, icon: Icons.email),
                      buildTextField(label: "Phone", controller: contactController, type: TextInputType.phone, icon: Icons.phone),
                      buildTextField(label: "HSC Total Marks", controller: hscTotalController, type: TextInputType.number, onChanged: (_) => calculatePercentage()),
                      buildTextField(label: "HSC Out Of", controller: hscOutOfController, type: TextInputType.number, onChanged: (_) => calculatePercentage()),
                      Text("HSC Percentage: ${hscPercentage.toStringAsFixed(2)}%", style: TextStyle(fontWeight: FontWeight.bold)),
                      buildTextField(label: "SSC Total Marks", controller: sscTotalController, type: TextInputType.number, onChanged: (_) => calculatePercentage()),
                      buildTextField(label: "SSC Out Of", controller: sscOutOfController, type: TextInputType.number, onChanged: (_) => calculatePercentage()),
                      Text("SSC Percentage: ${sscPercentage.toStringAsFixed(2)}%", style: TextStyle(fontWeight: FontWeight.bold)),
                      ...List.generate(7, (index) {
                        return buildTextField(label: 'Semester ${index + 1} CGPA', controller: semesterControllers[index], type: TextInputType.number, onChanged: (_) => calculateCGPA());
                      }),
                      Text("Overall CGPA: ${cgpa.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: pickResume,
                        icon: Icon(Icons.upload_file),
                        label: Text('Upload Resume'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: viewResume,
                        icon: Icon(Icons.visibility),
                        label: Text('View Resume'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form Submitted Successfully')));
                          }
                        },
                        child: Text('Register', style: TextStyle(fontSize: 18, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Color(0xFF6A89CC),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
