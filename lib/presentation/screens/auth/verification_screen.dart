import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  static const routeName = "otp_verification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CargoLinker"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Verification page"),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context)
                    .signup("dawoodkhatri18@gmail.com", "password", "222216");
              },
              child: const Text("Signup"))
        ],
      ),
    );
  }
}
