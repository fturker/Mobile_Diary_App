import 'package:flutter/material.dart';
import 'package:gunluk/pages/diary_page.dart';
import 'package:gunluk/pages/input_diary_page.dart';
import 'package:gunluk/pages/settings_page.dart';
import 'package:gunluk/widgets/diary_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/Constants.dart';
import '../constants/UIDesign.dart';
import '../constants/providers.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import 'my_home_page.dart';

List<Widget> _pages = [
  DiaryPage(),
  const MyHomePage(),
  const SettingsPage(),
];
Widget? currentPage;

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIDesign.getBackGroundColor("darkTheme"),
        extendBody: true,
        appBar: AppBar(
          title: Padding(
            padding: UIDesign.defaultTitlePadding(),
            child: Text("Günlüğüm", style: Constants.getTitleTextStyle()),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
        body: Consumer(
          builder: (context, ref, child) {
            if (ref.watch(inputDiary)) {
              return const InputDiaryPage();
            } else if (ref.watch(diarydetailPage)) {
              return DiaryList(diary: ref.read(currentDiary));
            } else {
              return _pages[ref.watch(currentIndex)];
            }
          },
        ));
  }
}
