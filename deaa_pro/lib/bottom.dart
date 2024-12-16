import 'package:deaa_pro/about.dart';
import 'package:deaa_pro/impact.dart';
import 'package:deaa_pro/main.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> _screens = [
    const SustainabilityHomePage(),
    const ImpactPage(),
    const AboutPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green.shade700,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'إعادة التدوير',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.terrain),
            label: 'التأثير',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'عن التطبيق',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
