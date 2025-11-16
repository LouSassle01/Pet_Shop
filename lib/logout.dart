import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

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
            "You have been logged out",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
