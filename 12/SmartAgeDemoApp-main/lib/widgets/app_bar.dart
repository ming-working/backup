import 'package:flutter/material.dart';

class SmartAgeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SmartAgeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Container(
        padding: const EdgeInsets.all(10),
        child: Image.asset('assets/logo/app_logo.png',
            height: 60), // Adjust size as needed
      ),
      leading: Container(), // Disable the default leading icon

      // actions: <Widget>[
      //   IconButton(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     icon: const Icon(Icons.menu,
      //         color: Color(0xFF004C37)), // Use any icon that suits your needs
      //     onPressed: () {
      //       Scaffold.of(context).openDrawer();
      //     },
      //   ),
      // ],
    );
  }
}
