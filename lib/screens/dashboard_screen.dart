import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: [
          const SizedBox(height: 120),
          Image.asset(
            'assets/images/stickmanYay.jpg',
            height: 350,
          ),
        ],
      ),
    );
  }
}
