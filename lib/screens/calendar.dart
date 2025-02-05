import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  static DateTime _selectedDay = DateTime.now();
  static DateTime _focusedDay = DateTime.now();
  int lastTimeYear = DateTime.now().year + 20;
  // 캘린더 마지막날을 현재 일자로 부터 20년 후로 설정

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45),
      child: TableCalendar(
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(lastTimeYear, 12, 31),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        locale: 'ko_KR',
        availableCalendarFormats: const {CalendarFormat.month: 'month'},
        calendarStyle: const CalendarStyle(
          holidayTextStyle: TextStyle(color: Colors.red),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            Color saturdayColor = Colors.blue;
            Color sundayColor = Colors.red;

            switch (day.weekday) {
              case 6:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(color: saturdayColor),
                  ),
                );
              case 7:
                return Center(
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: sundayColor,
                    ),
                  ),
                );
              default:
                return null;
            }
          },
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday) {
              return const Center(
                child: Text('일', style: TextStyle(color: Colors.red)),
              );
            } else if (day.weekday == DateTime.saturday) {
              return const Center(
                child: Text(
                  '토',
                  style: TextStyle(color: Colors.blue),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
