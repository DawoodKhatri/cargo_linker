import 'package:cargo_linker/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:cargo_linker/logic/cubits/auth_cubit/auth_state.dart';
import 'package:cargo_linker/presentation/screens/auth/signup_screen.dart';
import 'package:cargo_linker/presentation/screens/auth/verification_screen.dart';
import 'package:cargo_linker/presentation/screens/company_profile/company_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter an email';
                    } else if (!EmailValidator.validate(value.trim())) {
                      return "Invalid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 33),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      } else {
                        BlocProvider.of<AuthCubit>(context).login(
                            emailController.text.trim(),
                            passwordController.text.trim());
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                        child: const Text("Signup"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
