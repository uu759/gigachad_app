import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gigachad_app/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();
  late String dateStr;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    dateStr =
        "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        date = DateTime.now();
        dateStr =
            "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dateStr,
                style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(224, 224, 224, 1),
                ),
                child: const SizedBox(
                    width: 71.25,
                    height: 71.25,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromRGBO(69, 69, 69, 1),
                    )),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 24),
          Text(
            "오늘은 1월의 마지막 날이네요! 열심히 해서 목표를 달성해보세요!",
            style: GoogleFonts.gowunDodum(
                fontSize: 21, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "오늘의 목표",
                style: GoogleFonts.notoSans(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  print("Tapped!");
                  globals.selectedIndex.value = 2;
                },
                child: const Row(
                  children: [
                    Text(
                      "목표 수정하기 ",
                      style: TextStyle(
                        fontFamily: "NotoSans",
                        fontSize: 18,
                        color: Color.fromRGBO(0, 0, 0, 0.36),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(0, 0, 0, 0.36),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
