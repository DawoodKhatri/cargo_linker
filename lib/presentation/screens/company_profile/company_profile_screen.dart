import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:cargo_linker/logic/cubits/auth_cubit/auth_state.dart';
import 'package:cargo_linker/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({super.key});

  static const routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CargoLinker"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text("Home"),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
