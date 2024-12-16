import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'عن التطبيق',
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان الرئيسي
                Text(
                  'معلومات عن التطبيق',
                  style: GoogleFonts.cairo(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(height: 20),
                // وصف التطبيق
                Text(
                  'تطبيق "EcoRecycle" هو تطبيق موجه لتعليم وتوجيه المستخدمين حول كيفية إعادة التدوير بشكل فعال. يهدف التطبيق إلى نشر الوعي البيئي وتوفير نصائح عملية تساعد الأفراد على التقليل من تأثيراتهم البيئية.',
                  style: GoogleFonts.cairo(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                // فريق التطوير
                Text(
                  'فريق التطوير:',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                _buildTeamMemberCard("ضياء محمد خلف", 'رئيس الفريق', Icons.person),
                const SizedBox(height: 10),
                _buildTeamMemberCard(
                    'حسين نظير عامر', 'مصمم واجهة المستخدم', Icons.design_services),
                const SizedBox(height: 10),
                _buildTeamMemberCard(
                    'سجاد فرج مجيد', "مجمع بيانات", Icons.data_usage),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                // روابط التواصل
                Text(
                  'تابعنا على وسائل التواصل الاجتماعي:',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.blue.shade700),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.flutter_dash_rounded,
                          color: Colors.blue.shade600),
                      onPressed: () {},
                    ),
                    // IconButton(
                    //   icon: Icon(Icons, color: Colors.pink.shade600),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(String name, String role, IconData icon) {
    return Card(
      color: Colors.green.shade100,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.green.shade700, size: 40),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    role,
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
