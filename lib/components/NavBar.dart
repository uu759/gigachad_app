import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void onItemTapped(int index) {
    setState(() {
      globals.selectedIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    globals.selectedIndex.addListener(() => setState(() {}));
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: "Calender",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: "Edit",
        ),
      ],
      currentIndex: globals.selectedIndex.value,
      onTap: onItemTapped,
    );
  }
}
