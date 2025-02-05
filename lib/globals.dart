library globals;

import 'package:flutter/material.dart';
import 'package:gigachad_app/models/jeolgi_cal.dart';

ValueNotifier<int> selectedIndex = ValueNotifier<int>(1);

// 현재 날짜가 윤년인지 체크하는 함수
// https://m.blog.naver.com/kaiz00/222425335195 이거 참고했음
yoonNyunDate(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) ? 29 : 28;
}

int year = DateTime.now().year;
Map<String, DateTime> jeolgisDate = JeolgiCalculator.getJeolgi(year);

// TODO: 이거 말고 간단하게 하는 방법 있던거 같은데 모르겠다 수정할 수 있으면 수정해줘 땡큐
int ipChunDay = jeolgisDate["입춘"]!.day;
int usooDay = jeolgisDate["우수"]!.day;
int kyungChipDay = jeolgisDate["경칩"]!.day;
int chunBoonDay = jeolgisDate["춘분"]!.day;
int chungMyungDay = jeolgisDate["청명"]!.day;
int gokOoDay = jeolgisDate["곡우"]!.day;
int ipHaDay = jeolgisDate["입하"]!.day;
int soManDay = jeolgisDate["소만"]!.day;
int mangJongDay = jeolgisDate["망종"]!.day;
int haJiDay = jeolgisDate["하지"]!.day;
int soSuhDay = jeolgisDate["소서"]!.day;
int daeSuhDay = jeolgisDate["대서"]!.day;
int ipChooDay = jeolgisDate["입추"]!.day;
int chuhSuhDay = jeolgisDate["처서"]!.day;
int baekRoDay = jeolgisDate["백로"]!.day;
int chooBoonDay = jeolgisDate["추분"]!.day;
int hanRoDay = jeolgisDate["한로"]!.day;
int sangGangDay = jeolgisDate["상강"]!.day;
int ipDongDay = jeolgisDate["입동"]!.day;
int soSulDay = jeolgisDate["소설"]!.day;
int daeSulDay = jeolgisDate["대설"]!.day;
int dongJiDay = jeolgisDate["동지"]!.day;
int soHanDay = jeolgisDate["소한"]!.day;
int daeHanDay = jeolgisDate["대한"]!.day;

Map<int, Map<int, String>> motivationMents = {
  // 0은 특별한 날이 아닐 때 랜덤으로 나오는 멘트
  0: {
    1: "“오늘도 한 걸음! 🚶‍♂️” 작은 실천이 큰 변화를 만들거에요!",
    2: "“포기하지 마세요! 💪” 당신의 노력은 결코 헛되지 않을거에요.",
    3: "“지금이 가장 좋은 시작의 순간! ⏳” 망설이지 말고 도전하는거에요!",
    4: "“성공은 준비된 자의 몫! 🎯” 오늘도 성장하는 하루를 즐겨보아요.",
    5: "“하루하루가 모여 위대한 결과가 됩니다! 📈” 꾸준함이 가장 강한 힘입니다.",
    6: "“실패는 배움의 또 다른 이름! 🌟” 도전을 멈추지 마세요.",
    7: "“당신은 생각보다 더 강합니다! 💖” 믿고 나아가면 길이 보입니다.",
    8: "“작은 변화가 큰 기적을 만듭니다! 🔥” 오늘도 새로운 가능성을 열어 보세요.",
    9: "“목표를 향해 한 걸음 더! 🚀” 꾸준함이 최고의 전략입니다.",
    10: "“당신의 가능성은 무한합니다! ✨” 오늘도 빛나는 하루를 만들어 보세요."
  },

  1: {
    1: "새해가 밝았습니다!🚀 올해는 당신의 목표를 현실로 만들 차례입니다!",
    15: "오늘은 1월의 절반! ⏳지금까지의 성과를 돌아보고, 남은 날들을 더 빛나게 만들어 보세요! ✨",
    31: "1월의 끝, 새로운 시작! 🔄 1월의 성장을 돌아보고, 다음 달을 향해 힘차게 나아가세요! 🚀",
  },

  2: {
    1: "새로운 달, 새로운 기회! 🌱 2월에도 목표를 향해 한 걸음 더 나아가 보세요! 🚀",
    15: "오늘은 2월의 절반! ⏳지금까지의 성과를 돌아보고, 남은 날들을 더 빛나게 만들어 보세요! ✨",
    yoonNyunDate(DateTime.now().year):
        "2월의 끝, 새로운 시작! 🔄 2월의 성장을 돌아보고, 다음 달을 향해 힘차게 나아가세요! 🚀",
    // 2월이 29일까지 일때랑 28일까지 2개 있어서 이렇게 해뒀음
    ipChunDay:
        "봄의 시작, 입춘이에요! 🌱 따스한 봄햇살과 함께 새로운 계획을 세워보는 건 어떨까요?", // TODO: 멘트 수정
  },

  3: {
    1: "3월이 밝았습니다! 🌸 봄의 시작과 함께, 당신의 목표를 향해 한 걸음 더 나아가 보세요! 🚀", // TODO: 멘트 수정
    15: "오늘은 3월의 절반! ⏳지금까지의 성과를 돌아보고, 남은 날들을 더 빛나게 만들어 보세요! ✨", // TODO: 멘트 수정
    kyungChipDay:
        "만물이 겨울잠에서 깨어나는 날 경칩! 🌱 봄의 시작을 맞아, 새로운 계획을 세워보는 건 어떨까요?", // TODO: 멘트 수정
    chunBoonDay: "춘분이에요! 🌱 봄의 시작을 맞아, 새로운 계획을 세워보는 건 어떨까요?", // TODO: 멘트 수정
    31: "3월의 끝, 새로운 시작! 🔄 3월의 성장을 돌아보고, 다음 달을 향해 힘차게 나아가세요! 🚀", // TODO: 멘트 수정
  },

  4: {
    5: "오늘은 식목일! \"🌳🍎비록 내일 지구의 종말이 온다 하더라도, 나는 오늘 한 그루의 사과나무를 심겠다.\"",
  },
  5: {
    5: "\"오늘은 어린이날 우리들의 세상~\" 어릴 때 하고 싶었던 일, 오늘 하나씩 이루어 보는 건 어떨까요?",
    8: "어버이날", // TODO: 멘트 수정
    15: "스승의 날 / 세종대왕 나신 날", // TODO: 멘트 수정
  },
};
