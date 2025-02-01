import 'package:flutter/material.dart';
import 'package:gigachad_app/components/NavBar.dart';
import 'package:gigachad_app/globals.dart' as globals;
import 'package:gigachad_app/screens/calendar.dart';
import 'package:gigachad_app/screens/goal.dart';
import 'package:gigachad_app/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //이거 순서 중요함.
  final List<Widget> screens = const [
    CalendarScreen(),
    HomeScreen(),
    GoalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
            valueListenable: globals.selectedIndex,
            builder: (context, index, child) {
              return screens[index];
            }),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
