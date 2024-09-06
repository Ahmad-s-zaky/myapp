import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserService _userService = UserService();

  void _register() {
    final newUser = User(
      name: _nameController.text,
      address: _addressController.text,
      company: _companyController.text,
      phoneNumber: _phoneController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    _userService.saveUser(newUser);
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
            ),
            SizedBox(height: 10,),
            TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
            ),
            SizedBox(height: 10,),
            TextField(
                controller: _companyController,
                decoration: InputDecoration(
                  labelText: 'Perusahaan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
            ),
            SizedBox(height: 10,),
            TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
            ),
            SizedBox(height: 10,),
            TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
            ),
            SizedBox(height: 10,),
            TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                obscureText: true
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text('Register'),
            ),
          ],
        ),
        )
      ),
    );
  }
}
