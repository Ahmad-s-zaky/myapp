import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/register_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}