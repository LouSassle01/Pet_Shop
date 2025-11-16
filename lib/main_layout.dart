import 'package:flutter/material.dart';
import 'navbar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // FIXED LEFT NAVIGATION BAR
          const LeftSideNavBar(),

          // PAGE CONTENT
          Expanded(
            child: Container(
              color: Colors.white,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
