import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';

void main() {
  runApp(const MonjaApp());
}

class MonjaApp extends StatelessWidget {
  const MonjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
