import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImpactPage extends StatelessWidget {
  const ImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التأثير البيئي',
          style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: Colors.white),
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
                  'أثر إعادة التدوير على البيئة',
                  style: GoogleFonts.cairo(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(height: 20),
                // وصف التأثير
                Text(
                  'إعادة التدوير تساهم بشكل كبير في الحد من التلوث وحماية الموارد الطبيعية. من خلال إعادة التدوير، نحن نساهم في تقليل النفايات وتقليل استهلاك الموارد غير المتجددة.',
                  style: GoogleFonts.cairo(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                // بعض الإحصائيات
                Text(
                  'إحصائيات تأثير إعادة التدوير:',
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                _buildImpactCard(
                  'تقليل انبعاثات الكربون',
                  'إعادة التدوير يمكن أن تقلل من انبعاثات الكربون بنسبة تصل إلى 30%',
                  Icons.filter_vintage,
                ),
                const SizedBox(height: 10),
                _buildImpactCard(
                  'توفير الطاقة',
                  'إعادة التدوير تساعد في توفير الطاقة مقارنة باستخدام المواد الخام',
                  Icons.bolt,
                ),
                const SizedBox(height: 10),
                _buildImpactCard(
                  'حفظ الموارد الطبيعية',
                  'إعادة التدوير يقلل من استهلاك المواد الخام مثل المعادن، النفط، والغاز',
                  Icons.eco,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImpactCard(String title, String description, IconData icon) {
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
                    title,
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
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
