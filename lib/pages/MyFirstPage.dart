import 'package:flutter/material.dart';
import 'package:gunluk/pages/AccountPage.dart';
import 'package:gunluk/pages/DiaryPage.dart';
import 'package:gunluk/pages/InputDiaryPage.dart';
import 'package:gunluk/pages/SettingsPage.dart';
import 'package:gunluk/widgets/DiaryList.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/Constants.dart';
import '../constants/UIDesign.dart';
import '../constants/providers.dart';
import '../widgets/MyBottomNavigationbar.dart';
import 'MyHomePage.dart';

List<Widget> _pages = [DiaryPage(),MyHomePage(),SettingsPage(),AccountPage(),];
Widget? currentPage;

class MyFirstPage extends StatelessWidget{
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
        body: Consumer(builder: (context, ref, child) {
          if(ref.watch(Providers.inputDiary)){
            return const InputDiaryPage();
          }
          else if(ref.watch(Providers.diarydetailPage)){
            return DiaryList(diary: ref.read(Providers.currentDiary));
          }
          else{
            return _pages[ref.watch(Providers.currentIndex)];
          }
        },)
    );
  }
}
