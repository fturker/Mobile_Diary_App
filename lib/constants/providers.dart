import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gunluk/models/Diary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/diary_input_widget.dart';

final currentIndex = StateProvider<int>(
  (ref) {
    return 1;
  },
);

final inputDiary = StateProvider<bool>(
  (ref) {
    return false;
  },
);

final imagesList = StateProvider<List<String>>((ref) => []);

final inputDiaryTitle = StateProvider<TextEditingController>(
  (ref) {
    return TextEditingController();
  },
);

final inputDiaryText = StateProvider<TextEditingController>(
  (ref) {
    return TextEditingController();
  },
);

final diaryList = StateProvider<List<Diary>>((ref) {
  List<Diary> diary = [];
  for (int i = 0; DiaryInputWidget.box.get(i) != null; i++) {
    diary.add(DiaryInputWidget.box.get(i)!);
  }
  return diary;
});

final diarydetailPage = StateProvider<bool>((ref) {
  return false;
});
final currentDiary = StateProvider<Diary?>((ref) => null);

final userProvider = StateProvider<User?>((ref) => null);
