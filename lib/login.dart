import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;

          // Responsive sizes
          double titleFontSize = isSmallScreen ? 28 : 40;
          double paddingSize = isSmallScreen ? 20 : 60;

          // Branding Panel on the left side
          Widget branding = Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: isSmallScreen ? double.infinity : constraints.maxWidth * 0.4,
            height: isSmallScreen ? 200 : double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // RESPONSIVE LOGO
                  LayoutBuilder(builder: (context, inner) {
                    final panelWidth = isSmallScreen
                        ? constraints.maxWidth
                        : constraints.maxWidth * 0.4;

                    // Logo scales based on screen width
                    final logoSize = (panelWidth * 0.35).clamp(60.0, 300.0);

                    return Image.asset(
                      'assets/img/LogoBig.png',
                      width: logoSize,
                      fit: BoxFit.contain,
                    );
                  }),

                  const SizedBox(height: 20),

                  // TITLE TEXT
                  Text(
                    "WELCOME!",
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );

          // Login form on the right side with bg 
          Widget loginForm = Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/img/BG.png'), // your bg image
                fit: BoxFit.cover,
                opacity: 0.15, // faint background for readability
              ),
            ),
            child: Padding(
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
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.85),
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
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.85),
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
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/landing');
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.black,
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
            ),
          );

          // Responsive layout switch
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
