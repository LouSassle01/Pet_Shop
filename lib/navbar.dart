import 'package:flutter/material.dart';

class LeftSideNavBar extends StatefulWidget {
  const LeftSideNavBar({super.key});

  @override
  State<LeftSideNavBar> createState() => _LeftSideNavBarState();
}

class _LeftSideNavBarState extends State<LeftSideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        image: const DecorationImage(
          image: AssetImage('assets/img/BG.png'),
          fit: BoxFit.cover,
          opacity: 0.12,
        ),
      ),
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

          _NavItem(
            icon: Icons.home,
            text: 'Home',
            route: '/landing',
          ),

          _NavItem(
            icon: Icons.shopping_bag,
            text: 'Product Page',
            route: '/product',
          ),

          _NavItem(
            icon: Icons.settings,
            text: 'Settings',
            route: '/settings',
          ),

          _NavItem(
            icon: Icons.logout,
            text: 'Logout',
            route: '/logout',
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final String route;

  const _NavItem({required this.icon, required this.text, required this.route});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.blue.shade700;
    final pressedColor = Colors.blue.shade900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: (d) {
          _onTapUp(d);
          Navigator.pushReplacementNamed(context, widget.route);
        },
        onTapCancel: _onTapCancel,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          transform: Matrix4.identity()..scale(_isPressed ? 0.985 : 1.0),
          decoration: BoxDecoration(
            color: _isPressed ? pressedColor : baseColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade900, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: _isPressed ? 2 : 4,
                offset: Offset(0, _isPressed ? 1 : 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(widget.icon, color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              // Shiny overlay that appears while pressed
              AnimatedOpacity(
                opacity: _isPressed ? 0.18 : 0.0,
                duration: const Duration(milliseconds: 120),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: 1.2,
                    heightFactor: 1.6,
                    child: Transform.rotate(
                      angle: -0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.45),
                              Colors.white.withOpacity(0.0),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 0.6],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
