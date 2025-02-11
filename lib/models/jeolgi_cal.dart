// 이 코드의 시간은 https://m.blog.naver.com/kaiz00/222425335195 에서 가져왔습니다.

class JeolgiCalculator {
  static const int minutesPerYear = 525949; // 1년 = 525949분
  static const int baseYear = 1996; // 기준 연도
  static const List<String> jeolgis = [
    '입춘',
    '우수',
    '경칩',
    '춘분',
    '청명',
    '곡우',
    '입하',
    '소만',
    '망종',
    '하지',
    '소서',
    '대서',
    '입추',
    '처서',
    '백로',
    '추분',
    '한로',
    '상강',
    '입동',
    '소설',
    '대설',
    '동지',
    '소한',
    '대한',
    '입춘'
  ];
  static const List<int> jeolgiMinutes = [
    0,
    21355,
    42843,
    64498,
    86335,
    108366,
    130578,
    152958,
    175471,
    198077,
    220728,
    243370,
    265955,
    288432,
    310767,
    332928,
    354903,
    376685,
    398290,
    419736,
    441060,
    462295,
    483493,
    504693,
    525949
  ];

  // 특정 연도의 절기 날짜 계산
  static Map<String, DateTime> getJeolgi(int year) {
    int yearDiff = year - baseYear;
    int totalMinutes = yearDiff * minutesPerYear;
    DateTime ipchunDate =
        DateTime(baseYear, 2, 4).add(Duration(minutes: totalMinutes));

    Map<String, DateTime> result = {};
    for (int i = 0; i < jeolgis.length; i++) {
      DateTime jeolgiDate = ipchunDate.add(Duration(minutes: jeolgiMinutes[i]));
      result[jeolgis[i]] = jeolgiDate;
    }
    return result;
  }
}
