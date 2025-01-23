import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('이 코드를 읽는다면... 전 이미 이 프로젝트를 시작한 거겠죠'),
        ),
      ),
    );
  }
}
