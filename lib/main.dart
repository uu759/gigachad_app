import 'package:flutter/material.dart';
import 'package:gigachad_app/components/NavBar.dart';
import 'package:gigachad_app/globals.dart' as globals;
import 'package:gigachad_app/screens/calendar.dart';
import 'package:gigachad_app/screens/goal.dart';
import 'package:gigachad_app/screens/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gigachad_app/models/jeolgi_cal.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MainApp()));
  late int year = DateTime.now().year;
  Map<String, DateTime> jeolgisDate = JeolgiCalculator.getJeolgi(year);
  // print(jeolgisDate);
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  //이거 순서 중요함.
  final List<Widget> screens = [
    const CalendarScreen(),
    const HomeScreen(),
    const GoalScreen(),
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
