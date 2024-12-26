import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/providers.dart';

class MyBottomNavigationBar extends ConsumerWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(currentIndex),
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 24.w,
      onTap: (index) {
        if (ref.watch(inputDiary)) {
          ref.read(inputDiary.notifier).update((state) => false);
        }
        ref.read(diarydetailPage.notifier).update((state) => false);
        ref.read(currentIndex.notifier).update((state) => index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage("assets/Icons/diary-page-unselected.png")),
            label: "Günlüğüm",
            backgroundColor: Colors.purple,
            activeIcon: ImageIcon(
                AssetImage("assets/Icons/diary-page-selected.png"))),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage("assets/Icons/home-page-unselected.png")),
          label: "Ana Sayfa",
          backgroundColor: Colors.purple,
          activeIcon: ImageIcon(
              AssetImage("assets/Icons/home-page-selected.png")),
        ),
      ],
    );
  }
}
