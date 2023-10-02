import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double multiply;
  final double add;
  const Spacing({super.key, this.multiply = 1, this.add = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (8 * multiply) + add,
      height: (8 * multiply) + add,
    );
  }
}
