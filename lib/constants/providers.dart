import 'package:flutter/cupertino.dart';
import 'package:gunluk/models/Diary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/DiaryInputWidget.dart';

class Providers {

  static final currentIndex = StateProvider<int>((ref) {
    return 1;
  },);

  static final inputDiary = StateProvider<bool>((ref) {
    return false;
  },);

  static final imagesList = StateProvider<List<String>>((ref) => []);

  static final inputDiaryTitle = StateProvider<TextEditingController>((ref) {
    return TextEditingController();
  },);

  static final inputDiaryText = StateProvider<TextEditingController>((ref) {
    return TextEditingController();
  },);

  static final diaryList = StateProvider<List<Diary>>((ref) {
    List<Diary> diary = [];
    for(int i = 0;DiaryInputWidget.box.get(i) != null;i++) {
      diary.add(DiaryInputWidget.box.get(i)!);
    }
    return diary;
  });

  static final diarydetailPage = StateProvider<bool>((ref) {
    return false;
  });

  static final currentDiary = StateProvider<Diary?>((ref) => null);

}