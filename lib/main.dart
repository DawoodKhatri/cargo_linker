import 'package:cargo_linker/core/routes.dart';
import 'package:cargo_linker/core/ui.dart';
import 'package:cargo_linker/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CargoLinkerApp());
}

class CargoLinkerApp extends StatelessWidget {
  const CargoLinkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  MultiBlocProvider(
        //   providers: const [],
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      // ),
    );
  }
}
