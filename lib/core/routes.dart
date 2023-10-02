import 'package:cargo_linker/presentation/screens/auth/login_screen.dart';
import 'package:cargo_linker/presentation/screens/auth/signup_screen.dart';
import 'package:cargo_linker/presentation/screens/auth/verification_screen.dart';
import 'package:cargo_linker/presentation/screens/company_profile/company_profile_screen.dart';
import 'package:cargo_linker/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case VerificationScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());

      case CompanyProfileScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const CompanyProfileScreen());

      default:
        return null;
    }
  }
}
