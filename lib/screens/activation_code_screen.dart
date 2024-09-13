import 'package:flutter/material.dart';

class ActivationCodeScreen extends StatefulWidget {
  @override
  _ActivationCodeScreenState createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  // Function to handle code submission
  void _submitCode() {
    if (_formKey.currentState!.validate()) {
      String activationCode = _codeController.text;

      // Call API or any logic to submit the activation code here
      print("Activation code submitted: $activationCode");

      // After successful submission, navigate to dashboard or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Activation code submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukan Kode Aktivasi Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter the activation code sent to your email:',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              
              // Input field for activation code
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: 'Activation Code',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the activation code';
                  }
                  if (value.length != 6) {
                    return 'Activation code should be 6 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Submit button
              ElevatedButton(
                onPressed: _submitCode,
                child: Text('Activate Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
