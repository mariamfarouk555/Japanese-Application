import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
      Container(
  height: 300,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    image: const DecorationImage(
      image: AssetImage("assets/aboutus.png"),
      fit: BoxFit.cover,
    ),
  ),
),
            Padding(
              padding: const EdgeInsets.only(right: 10,bottom: 20, left: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromARGB(255, 245, 121, 224),
                        child: Icon(Icons.school, size: 50, color: Colors.white),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        "About Us",
                        style: GoogleFonts.fredoka(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "A simple language learning app with interactive lessons & quizzes.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        "Version 1.0.0",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Divider(),

                      ListTile(
                        leading: const Icon(Icons.email, color: Colors.purple),
                        title: Text(
                          "support@tukoapp.com",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.language, color: Colors.purple),
                        title: Text(
                          "www.tukoapp.com",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
