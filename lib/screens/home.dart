import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gigachad_app/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();
  late String dateStr;
  Timer? _timer;

  Future<SharedPreferences> pref = SharedPreferences.getInstance();

  //yyyy/mm/dd 형식의 날짜 문자열을 제작해주는 함수.
  String makeDateString(DateTime date1) {
    return "${date1.year}/${date1.month.toString().padLeft(2, '0')}/${date1.day.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();

    dateStr = makeDateString(date);

    //1초마다 날짜 체크하는 함수.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!mounted) return;

      //기기에 저장된 데이터 불러오기.
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      //만약 저장된 데이터 중 지금 날짜 문자열(예: 2025/01/01)의 데이터가 존재하지 않다면
      //날짜가 바뀌었음을 의미하므로 날짜와 멘트를 업데이트.
      if (prefs.getString(makeDateString(DateTime.now())) == null) {
        //페이지 새로고침을 위해 setState 필수.
        setState(() {
          date = DateTime.now();
          dateStr = makeDateString(date);

          //지금 날짜에 해당하는 멘트가 있는지 체크(Month와 Day로만 구함)
          if (globals
                  .motivationMents[DateTime.now().month]![DateTime.now().day] !=
              null) {
            prefs.setString(
                makeDateString(DateTime.now()),
                globals.motivationMents[DateTime.now().month]![
                    DateTime.now().day]!);
          }
          //지금 날짜에 해당하는 멘트가 없다면 globals.motivationMents[0]에서 랜덤으로 1개 뽑음.
          else {
            //1 <= randNum <= 10
            final int randNum = Random().nextInt(10) + 1;
            prefs.setString(makeDateString(DateTime.now()),
                globals.motivationMents[0]![randNum]!);
          }
          pref = SharedPreferences.getInstance();
        });
      }
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
          FutureBuilder(
            future: pref,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // snapshot.data!.clear();
                if (snapshot.data!.getString(makeDateString(date)) == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Text(
                  snapshot.data!.getString(makeDateString(date))!,
                  style: GoogleFonts.gowunDodum(
                      fontSize: 21, fontWeight: FontWeight.w500),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
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
