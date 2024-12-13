import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';

class SmartAgeDrawer extends StatelessWidget {
  const SmartAgeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: smartAgePrimaryColor,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.account_circle,
              size: 40,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            iconColor: Colors.black,
            title: const Text('H O M E'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, '/homepage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            iconColor: Colors.black,
            title: const Text('S E T T I N G'),
            onTap: () {
              // Navigator.pushNamed(context, '/settingpage');
            },
          ),
        ],
      ),
    );
  }
}
