import 'package:flutter/material.dart';

class LeftSideNavBar extends StatelessWidget {
  const LeftSideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          // USER ICON OR LOGO
          Container(
            height: 120,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/LogoSmall.png',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),


          // HOME
          navItem(
            context: context,
            icon: Icons.home,
            text: "Home",
            route: "/landing",
          ),

          // PRODUCT PAGE
          navItem(
            context: context,
            icon: Icons.shopping_bag,
            text: "Product Page",
            route: "/product",
          ),

          // SETTINGS
          navItem(
            context: context,
            icon: Icons.settings,
            text: "Settings",
            route: "/settings",
          ),

          // LOGOUT
          navItem(
            context: context,
            icon: Icons.logout,
            text: "Logout",
            route: "/logout",
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String route,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
