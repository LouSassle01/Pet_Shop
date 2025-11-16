import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';
import 'landingpage.dart';
import 'navbar.dart';
import 'main_layout.dart';
import 'p_overview.dart';
import 'settings.dart';
import 'logout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS System',

      initialRoute: '/login',

      routes: {
        // Pages WITHOUT navbar
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),

        // Pages WITH fixed navbar
        '/landing': (context) => const MainLayout(child: LandingPage()),
        '/product': (context) => const MainLayout(child: POverview()),
        '/settings': (context) => const MainLayout(child: SettingsPage()),
        '/logout': (context) => const MainLayout(child: LogoutPage()),
      },
    );
  }
}
