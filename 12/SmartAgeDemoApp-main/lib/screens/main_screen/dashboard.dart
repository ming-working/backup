/*
  Dashboard
  work as the wrapper for the contents, appbar and bottom navigation bar.
*/

import 'package:flutter/material.dart';
import 'package:smartage_care/screens/main_screen/alert/alert_screen.dart';
import 'package:smartage_care/screens/main_screen/circle_of_support/circle_of_support_screen.dart';
import 'package:smartage_care/screens/main_screen/home/home_screen.dart';
import 'package:smartage_care/screens/main_screen/settings/setting_screen.dart';
import 'package:smartage_care/widgets/app_bar.dart';
import 'package:smartage_care/widgets/drawer.dart';
import 'package:smartage_care/widgets/navigation_bar.dart';
import 'package:smartage_care/screens/main_screen/alert/warning_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const double iconSize = 30.0;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Navigation Bar Controller
  // final landingPageController = Get.put(
  //   DashboardPageController(),
  //   permanent: false,
  // );
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const WarningPage(),
    const CircleOfSupportScreen(),
    SettingScreen(),
  ];
  /*
    // Naviation bar
      // Home
      // Alert
      // Circle of Support
      // Message  
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const SmartAgeAppBar(), // For Joe To see , I added this refactored appbar in widgets
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SmartAgeNavigationBar(
        currentIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      drawer: const SmartAgeDrawer(),
      //Old version of appbar
      // AppBar(
      //   // elevation: 0,
      //   // backgroundColor: Colors.transparent,
      //   // centerTitle: true,
      //   // title: Container(
      //   //   padding: const EdgeInsets.symmetric(vertical: 10),
      //   //   child: Image.asset(
      //   //     "assets/logo/SmartAge Logo  1.png",
      //   //     fit: BoxFit.cover,
      //   //     // height: 110,
      //   //     // width: 200,
      //   //   ),
      //   // ),

      //   // SvgPicture.asset(
      //   //   'assets/logo/SmartAge Logo  1.svg', // Replace with your SVG file path
      //   //   fit: BoxFit.fitHeight,
      //   //   semanticsLabel: 'SmartAge Logo',
      //   //   height: 100,
      //   //   width: 200,
      //   // ),
      // ),

      // Background Color

      // Widgets in the center
      // body: Scaffold(
      //   body: Obx(
      //     () => IndexedStack(
      //       index: landingPageController.tabIndex.value,
      //       children: [
      //         const AlertScreen(),
      //         const CircleOfSupportScreen(),
      //         HomeScreen(),
      //         const MessageScreen(),
      //         SettingScreen(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
