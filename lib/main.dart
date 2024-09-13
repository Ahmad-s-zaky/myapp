import 'package:flutter/material.dart';

import 'routing/router.dart';

void main() {
  runApp(const MonjaApp());
}

class MonjaApp extends StatelessWidget {
  const MonjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Monja Login-Register',
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
