import 'package:flutter/material.dart';
import 'package:myapp/routing.dart';

void main() {
  runApp(const MonjaApp());
}

class MonjaApp extends StatelessWidget {
  const MonjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Register App',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: generateRoute,
      initialRoute: '/login',
    );
  }
}