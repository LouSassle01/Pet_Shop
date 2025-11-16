import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/BG.png'),
            fit: BoxFit.cover,
            opacity: 0.15,
          ),
        ),
        child: const Center(
          child: Text(
            "Welcome to Home Page",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
