import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to Home Page",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
