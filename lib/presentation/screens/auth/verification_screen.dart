import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  final otpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CargoLinker"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("A 6-digit verification code was send on"),
              SizedBox(
                height: 8,
              ),
              Text("try@gmail.com"),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Incorrect Email?"),
                  SizedBox(
                    width: 12,
                  ),
                  TextButton(onPressed: () {}, child: Text("Change"))
                ],
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: otpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7)),
                  labelText: 'OTP Verification',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your OTP';
                  } else if (value.length != 6) {
                    return 'Please enter your 6 digit OTP';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text("Resend OTP in 59s"),
              TextButton(onPressed: () {}, child: Text("Resend OTP")),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Text('Complete Signup'),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 12,
                  ),
                  TextButton(onPressed: () {}, child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
