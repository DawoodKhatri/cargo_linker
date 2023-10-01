import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:cargo_linker/logic/cubits/auth_cubit/auth_state.dart';
import 'package:cargo_linker/presentation/screens/auth/signup_screen.dart';
import 'package:cargo_linker/presentation/screens/auth/verification_screen.dart';
import 'package:cargo_linker/presentation/screens/company_profile/company_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOTPVerificationState) {
          Navigator.pushNamed(context, VerificationScreen.routeName);
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is AuthLoggedInState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(
              context, CompanyProfileScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CargoLinker"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text("Login page"),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context)
                      .login("dawoodkhatri18@gmail.com", "password");
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignupScreen.routeName);
                },
                child: const Text("Create Account"))
          ],
        ),
      ),
    );
  }
}
