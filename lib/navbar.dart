import 'package:flutter/material.dart';

class LeftSideNavBar extends StatelessWidget {
  const LeftSideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.pushReplacementNamed(context, route);
        },
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade900, width: 1.5),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
