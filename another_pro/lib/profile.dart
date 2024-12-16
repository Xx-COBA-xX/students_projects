import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final List<DeveloperInfo> developers = [
    DeveloperInfo(
      name: 'علي ضياء هاشم',
      role: 'Lead Developer',
      buildTime: '9 hours',
      features: [
        'UI/UX Design',
        'Core Features Implementation',
        'Database Integration'
      ],
    ),
    DeveloperInfo(
      name: 'ابراهيم ثائر فاضل',
      role: 'Frontend Developer',
      buildTime: '11 hours',
      features: ['Product Catalog', 'Shopping Cart', 'User Authentication'],
    ),
    DeveloperInfo(
      name: 'محمد شرف عبد الجليل',
      role: 'Backend Developer',
      buildTime: '5 hours',
      features: ['API Integration', 'Performance Optimization', 'Testing'],
    ),
  ];

  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Development Team',style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const Icon(
                  Icons.code,
                  size: 64,
                  color: Colors.pink,
                ),
                const SizedBox(height: 16),
                Text(
                  'App Development Details',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          ...developers.map((dev) => DeveloperCard(developer: dev)),
        ],
      ),
    );
  }
}

class DeveloperInfo {
  final String name;
  final String role;
  final String buildTime;
  final List<String> features;

  DeveloperInfo({
    required this.name,
    required this.role,
    required this.buildTime,
    required this.features,
  });
}

class DeveloperCard extends StatelessWidget {
  final DeveloperInfo developer;

  const DeveloperCard({super.key, required this.developer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        developer.name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        developer.role,
                        style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    developer.buildTime,
                    style: GoogleFonts.poppins(
                      color: Colors.pink[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Features Implemented:',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...developer.features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle,
                          size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        feature,
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
