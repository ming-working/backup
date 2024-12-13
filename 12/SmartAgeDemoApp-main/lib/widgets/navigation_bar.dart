import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartAgeNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const SmartAgeNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => onItemSelected(index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: "dashBoardHome".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_outlined),
            activeIcon: const Icon(Icons.notifications),
            label: "dashBoardAlert".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups_outlined),
            activeIcon: const Icon(Icons.groups),
            label: "dashBoardCircleofSupport".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: "profileScreenSettings".tr,
          ),
        ],
        selectedItemColor:
            const Color(0xFF388C74), // Change the color of the selected item
        unselectedItemColor:
            Colors.grey, // Change the color of the unselected items
        backgroundColor: Colors.blue, // Change the background color
      ),
    );
  }
}
