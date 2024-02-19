import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gunluk/constants/UIDesign.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/providers.dart';

class MyBottomNavigationBar extends ConsumerWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(Providers.currentIndex),
      type: BottomNavigationBarType.shifting,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 24.w,
      onTap: (index) {
        if(ref.watch(Providers.inputDiary)){
          ref.read(Providers.inputDiary.notifier).update((state) => false);
        }
        ref.read(Providers.diarydetailPage.notifier).update((state) => false);
        ref.read(Providers.currentIndex.notifier).update((state) => index);
      },
      items: [
        BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/Icons/diary-page-unselected.png")),
            label: "Günlüğüm",backgroundColor: UIDesign.getBottomNavigationBarColor("darkTheme"),
            activeIcon: const ImageIcon(AssetImage("assets/Icons/diary-page-selected.png"))
        ),
        BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/Icons/home-page-unselected.png")),
          label: "Ana Sayfa",backgroundColor: UIDesign.getBottomNavigationBarColor("darkTheme"),
          activeIcon: const ImageIcon(AssetImage("assets/Icons/home-page-selected.png")),
        ),
        BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/Icons/settings-page-unselected.png")),
            label: "Ayarlar",backgroundColor: UIDesign.getBottomNavigationBarColor("darkTheme"),
            activeIcon: const ImageIcon(AssetImage("assets/Icons/settings-page-selected.png"))
        ),
        BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/Icons/user-page-unselected.png")),
            label: "Hesabım",backgroundColor: UIDesign.getBottomNavigationBarColor("darkTheme"),
            activeIcon: const ImageIcon(AssetImage("assets/Icons/user-page-selected.png"))
        ),
      ],
    );
  }
}
