import 'package:flutter/material.dart';
import 'package:gigachad_app/components/NavBar.dart';
import 'package:gigachad_app/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: HomeScreen(),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
