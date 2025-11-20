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

      // Use onGenerateRoute so we can control transitions.
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          // Pages WITHOUT navbar
          case '/login':
            page = const LoginPage();
            break;
          case '/register':
            page = const RegisterPage();
            break;

          // Pages WITH fixed navbar
          case '/landing':
            page = const MainLayout(child: LandingPage());
            break;
          case '/product':
            page = const MainLayout(child: POverview());
            break;
          case '/settings':
            page = const MainLayout(child: SettingsPage());
            break;
          case '/logout':
            page = const MainLayout(child: LogoutPage());
            break;
          default:
            page = const LoginPage();
        }

        // For the main content routes, use zero-duration transitions
        // to make navigation seamless (no popup/animation).
        final seamlessRoutes = {'/landing', '/product', '/settings', '/logout'};
        if (seamlessRoutes.contains(settings.name)) {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        }

        // Default to MaterialPageRoute for other pages (login/register)
        return MaterialPageRoute(builder: (context) => page, settings: settings);
      },
    );
  }
}
