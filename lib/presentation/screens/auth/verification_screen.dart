import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  static const routeName = "otp_verification";

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
              const Text("A 6-digit verification code was send on"),
              const SizedBox(
                height: 8,
              ),
              const Text("try@gmail.com"),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Incorrect Email?"),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(onPressed: () {}, child: const Text("Change"))
                ],
              ),
              const SizedBox(
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
                  if (value!.trim().isEmpty) {
                    return 'Please enter your OTP';
                  } else if (value.trim().length != 6) {
                    return 'Please enter your 6 digit OTP';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Resend OTP in 59s"),
              TextButton(onPressed: () {}, child: const Text("Resend OTP")),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    } else {
                      BlocProvider.of<AuthCubit>(context).signup(
                          "dawoodkhatri18@gmail.com",
                          "password",
                          otpController.text.trim());
                    }
                  },
                  child: const Text('Complete Signup'),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 12,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
