import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {

  final void Function()? onTap;
  final child;

  const Mybutton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
      ),
    );
  }
}
