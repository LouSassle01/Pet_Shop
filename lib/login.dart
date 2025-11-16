import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;

          // Flexible font size based on width
          double titleFontSize = isSmallScreen ? 28 : 40;
          double paddingSize = isSmallScreen ? 20 : 60;

          Widget branding = Container(
            color: Colors.blue.shade700,
            width: isSmallScreen ? double.infinity : constraints.maxWidth * 0.4,
            height: isSmallScreen ? 200 : double.infinity,
            child: Center(
              child: Text(
                "POS SYSTEM",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );

          Widget loginForm = Padding(
            padding: EdgeInsets.all(paddingSize),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 30),

                    // Username
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Username / Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/landing');
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

          // Layout switch: Column for small screens, Row for large
          return isSmallScreen
              ? Column(
            children: [
              branding,
              Expanded(child: loginForm),
            ],
          )
              : Row(
            children: [
              Expanded(flex: 2, child: branding),
              Expanded(flex: 3, child: loginForm),
            ],
          );
        },
      ),
    );
  }
}
