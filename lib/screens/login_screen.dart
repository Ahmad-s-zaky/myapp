import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      var url = Uri.parse("");
      var response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/dashboard');
      } else {
        print('Login gagal: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: [
          const SizedBox(height: 50),
          Image.asset(
            alignment: Alignment.center,
            'assets/images/logoMonja.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 50,
          ),
          _formInput(),
          Container(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          buttonLogin(context),
          createAccount(context),
        ],
      ),
    );
  }

  Center createAccount(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: const Text('Create Account'),
      ),
    );
  }

  ElevatedButton buttonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _loginUser();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Column _formInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            fillColor: Colors.white,
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Isi email Anda';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _passwordController,
          obscureText: _obsecureText,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                iconSize: 20,
                icon: Icon(
                  _obsecureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Isi password Anda';
            }
            return null;
          },
        )
      ],
    );
  }
}
