import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static const routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CargoLinker"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text("Signup page"),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context)
                    .emailVerify("dawoodkhatri18@gmail.com");
              },
              child: const Text("Get Verification code"))
        ],
      ),
    );
  }
}
