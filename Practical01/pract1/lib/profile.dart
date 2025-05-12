import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF6CF), // Cream background
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6F4616), // Dark Brown
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF6F4616), width: 4), // Dark Brown border
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF6F4616).withOpacity(0.4),
                      blurRadius: 12,
                      spreadRadius: 4,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Om Dinesh Shinde',
              style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF6F4616)), // Dark Brown
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            _buildSectionTitle('About Me'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Passionate developer with expertise in web and mobile applications, focusing on creating user-friendly experiences.',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.black87),
              ),
            ),
            SizedBox(height: 24),
            _buildSectionTitle('Interests'),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                _buildSkillChip('📸 Photographer'),
                _buildSkillChip('👨🏻‍💻 PhotoShop'),
                _buildSkillChip('☕ Java')
              ],
            ),
            SizedBox(height: 24),
            _buildSectionTitle('Education'),
            _buildEducationTile('Master of Computer Application', 'Sardar Patel Institute of Technology, Mumbai'),
            _buildEducationTile('Bachelor of Computer Application', 'YCMOU, Pune'),
            SizedBox(height: 24),
            _buildSectionTitle('Contact'),
            _buildContactInfo(Icons.email, 'om.shinde24@spit.ac.in'),
            _buildContactInfo(Icons.link, 'linkedin.com/in/om-shinde/'),
            _buildContactInfo(Icons.message, 'twitter.com/Om_Shinde'),
            SizedBox(height: 24),
            Text(
              '© 2025 Om Shinde',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF936025), // Brown
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill, style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
      backgroundColor: Color(0xFFBE7333), // Warm Brown
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildEducationTile(String degree, String institution) {
    return Column(
      children: [
        Text(
          degree,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF54350D)), // Deep Brown
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          institution,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFF6F4616), size: 22), // Dark Brown
          SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.roboto(fontSize: 16, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
