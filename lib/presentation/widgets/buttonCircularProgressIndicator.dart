import 'package:flutter/material.dart';

class ButtonCircularProgressIndicator extends StatelessWidget {
  const ButtonCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }
}
