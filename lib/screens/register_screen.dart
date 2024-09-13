import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _noTelponController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      User newUser = User(
        nama: _namaController.text,
        alamat: _alamatController.text,
        email: _emailController.text,
        password: _passwordController.text,
        noTelpon: _noTelponController.text,
        company: _companyController.text,
      );
      var url = Uri.parse("");
      var response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(newUser.toJson()),
      );
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/login');
      } else {
        print('Registrasi gagal: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: <Widget>[
          const SizedBox(height: 30),
          TextFormField(
            controller: _namaController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi nama lengkap Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _alamatController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Alamat',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi alamat Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _noTelponController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Nomor Telepon',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi nomor telpon Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _companyController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Company',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi company Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              filled: true,
              fillColor: Colors.white,
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi password Anda';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _registerUser();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
